import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart';
import 'package:responsive_demo/database/database_extensions.dart';
import 'package:responsive_demo/globals.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:tuple/tuple.dart';

class DatabaseProvider {
  // TASK
  static const String TABLE_TASK = 'task';
  static const String COLUMN_TASK_ID = 'task_id';
  static const String COLUMN_TASK_NAME = 'task_name';
  static const String COLUMN_TASK_STATUS_ID = 'task_status';
  static const String COLUMN_TASK_CREATOR_ID = 'task_creator';
  static const String COLUMN_TASK_DESCRIPTION = 'task_description';
  static const String COLUMN_TASK_TEXT_CONTENT = 'task_textContent';
  static const String COLUMN_TASK_CUSTOM_ID = 'task_customId';
  static const String COLUMN_TASK_ORDER_INDEX = 'task_order_index';
  static const String COLUMN_TASK_PARENT_ID = 'task_parent_id';

  // STATUS
  static const String TABLE_STATUS = 'status';
  static const String COLUMN_STATUS_ID = 'status_id';
  static const String COLUMN_STATUS_COLOR = 'status_color';
  static const String COLUMN_STATUS_TYPE = 'status_type';
  static const String COLUMN_STATUS_ORDER_INDEX = 'status_order_index';

  // USER
  static const String TABLE_USER = 'user';
  static const String COLUMN_USER_ID = 'user_id';
  static const String COLUMN_USER_NAME = 'user_name';
  static const String COLUMN_USER_COLOR = 'user_color';
  static const String COLUMN_USER_PROFILE_PICTURE = 'user_profile_picture';
  static const String COLUMN_USER_EMAIL = 'user_email';
  static const String COLUMN_USER_INITIALS = 'user_initials';

  // ASSIGNEES
  static const String TABLE_ASSIGNATION = 'assignation';
  static const String COLUMN_ASSIGNEES_ASSIGNEE_ID = 'assignee_id';
  static const String COLUMN_ASSIGNEES_TASK_ID = 'assigned_task_id';

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    Sqflite.devSetDebugModeOn(true);
    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();
    return _database;
  }

  static Future _onConfigure(Database db) async {
    // Enable FOREIGN KEY
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> createDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'clickup.db');

    // await deleteDatabase(dbPath);

    return await openDatabase(
      dbPath,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database database, int version) async {
    // var count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK'));
    // logger.i('TABLE $TABLE_TASK row count : $count');

    // CREATE USER TABLE
    await database.execute("CREATE TABLE IF NOT EXISTS $TABLE_USER ("
        "$COLUMN_USER_ID INTEGER NOT NULL PRIMARY KEY,"
        "$COLUMN_USER_NAME TEXT,"
        "$COLUMN_USER_COLOR TEXT,"
        "$COLUMN_USER_PROFILE_PICTURE TEXT,"
        "$COLUMN_USER_EMAIL TEXT,"
        "$COLUMN_USER_INITIALS TEXT)");

    // CREATE STATUS TABLE
    await database.execute("CREATE TABLE IF NOT EXISTS $TABLE_STATUS ("
        "$COLUMN_STATUS_ID TEXT NOT NULL PRIMARY KEY,"
        "$COLUMN_STATUS_COLOR TEXT,"
        "$COLUMN_STATUS_ORDER_INDEX INTEGER,"
        "$COLUMN_STATUS_TYPE TEXT)");

    // CREATE TASK TABLE
    await database.execute('''CREATE TABLE IF NOT EXISTS $TABLE_TASK (
        $COLUMN_TASK_ID TEXT NOT NULL PRIMARY KEY,
        $COLUMN_TASK_NAME TEXT,
        $COLUMN_TASK_STATUS_ID TEXT,
        $COLUMN_TASK_CREATOR_ID INTEGER,
        $COLUMN_TASK_DESCRIPTION TEXT,
        $COLUMN_TASK_TEXT_CONTENT TEXT,
        $COLUMN_TASK_ORDER_INDEX TEXT,
        $COLUMN_TASK_CUSTOM_ID TEXT,
        $COLUMN_TASK_PARENT_ID TEXT,
        FOREIGN KEY ($COLUMN_TASK_CREATOR_ID) REFERENCES $TABLE_USER($COLUMN_USER_ID) ON DELETE CASCADE,
        FOREIGN KEY ($COLUMN_TASK_STATUS_ID) REFERENCES $TABLE_STATUS($COLUMN_STATUS_ID) ON DELETE CASCADE)''');

    // CREATE ASSIGNATION TABLE
    await database.execute('''CREATE TABLE IF NOT EXISTS $TABLE_ASSIGNATION (
        $COLUMN_ASSIGNEES_ASSIGNEE_ID INTEGER NOT NULL,
        $COLUMN_ASSIGNEES_TASK_ID TEXT NOT NULL,
        FOREIGN KEY ($COLUMN_ASSIGNEES_ASSIGNEE_ID) REFERENCES $TABLE_USER($COLUMN_USER_ID) ON DELETE CASCADE,
        FOREIGN KEY ($COLUMN_ASSIGNEES_TASK_ID) REFERENCES $TABLE_TASK($COLUMN_TASK_ID) ON DELETE CASCADE)''');
  }

  Future<List<Task>> getTasks() async {
    final db = await database;

    List<Task> flatTaskList = [];

    var count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK'));
    logger.i('TABLE $TABLE_TASK row count : $count');

    final tasks = await db.rawQuery(
        // '''SELECT * FROM $TABLE_TASK''');
        '''SELECT * FROM $TABLE_TASK LEFT JOIN $TABLE_USER ON $TABLE_TASK.$COLUMN_TASK_CREATOR_ID == $TABLE_USER.$COLUMN_USER_ID LEFT JOIN $TABLE_STATUS ON $TABLE_TASK.$COLUMN_TASK_STATUS_ID == $TABLE_STATUS.$COLUMN_STATUS_ID''');
    // '''SELECT * FROM $TABLE_TASK''');
    // var tasks = await db.query(TABLE_TASK,
    //     columns: [COLUMN_TASK_ID, COLUMN_TASK_CREATOR_ID, COLUMN_TASK_CUSTOM_ID, COLUMN_TASK_TEXT_CONTENT, COLUMN_TASK_DESCRIPTION]);

    print('coucou');

    Future<void> processTask(Map<String, dynamic> map) async {
      Task task = Task.fromMap(map);
      final assignees = await db.rawQuery(
          '''SELECT * FROM $TABLE_ASSIGNATION LEFT JOIN $TABLE_USER ON $TABLE_ASSIGNATION.$COLUMN_ASSIGNEES_ASSIGNEE_ID == $TABLE_USER.$COLUMN_USER_ID WHERE $COLUMN_ASSIGNEES_TASK_ID == \"${task.id}\"''');
      task.assignees.addAll(assignees.map((assigneeMap) => User.fromMap(assigneeMap)).toList());
      flatTaskList.add(task);
    }

    final futures = tasks.map((e) => processTask(e));
    await Future.wait(futures);

    return flatTaskList.toStructuredList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final db = await database;

    logger.i('saving tasks in database');

    // Gather tasks and their subtasks in a single list
    final flatTaskList = tasks.expand<Task>((task) => [task, ...task.children].toList());

    final List<Tuple2<String, int>> taskAssignations = [];

    // The easiest way but not the most optimized : erase all the data before saving new data
    // We avoid handling update references, new users, tasks..
    await db.transaction((txn) async {
      final batch = txn.batch();

      // txn.execute('DELETE FROM $TABLE_ASSIGNATION');
      // txn.execute('DELETE FROM $TABLE_TASK');
      // txn.execute('DELETE FROM $TABLE_STATUS');
      // txn.execute('DELETE FROM $TABLE_USER');

      batch.execute('DELETE FROM $TABLE_ASSIGNATION');
      batch.execute('DELETE FROM $TABLE_TASK');
      batch.execute('DELETE FROM $TABLE_STATUS');
      batch.execute('DELETE FROM $TABLE_USER');

      var count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_STATUS'));
      logger.i('TABLE $TABLE_STATUS row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_USER'));
      logger.i('TABLE $TABLE_USER row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK'));
      logger.i('TABLE $TABLE_TASK row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_ASSIGNATION'));
      logger.i('TABLE $TABLE_ASSIGNATION row count : $count');

      final statusList = groupBy<Task, Status>(flatTaskList, (Task task) => task.status).keys;
      // final usersList = groupBy<Task, User>(flatTaskList, (Task task) => task.creator).keys;

      final usersSet = Set<User>();
      flatTaskList.forEach((task) {
        // usersSet.add(task.creator);
        usersSet.addAll(task.assignees);
        // usersSet.addAll(task.watchers);
      });

      final usersList = usersSet.toList();

      print('coucou');

      // final batch = txn.batch();

      for (Status status in statusList) {
        batch.insert(TABLE_STATUS, status.toMap());
      }
      for (User user in usersList) {
        batch.insert(TABLE_USER, user.toMap());
      }

      flatTaskList.forEach((task) {
        batch.insert(TABLE_TASK, task.toMap());
        task.assignees.forEach((assignee) {
          // print('assignee: ${assignee.id}, task: ${task.id} ${task.name}');

          taskAssignations.add(Tuple2(task.id, assignee.id));
        });
      });

      await batch.commit(noResult: true);

      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_STATUS'));
      logger.i('TABLE $TABLE_STATUS row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_USER'));
      logger.i('TABLE $TABLE_USER row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK'));
      logger.i('TABLE $TABLE_TASK row count : $count');
    });

    // await db.transaction((txn) async {
    //   final batch = txn.batch();
    //   taskAssignations.forEach((assinationTuple) async {
    //     var count1 = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_USER WHERE $COLUMN_USER_ID == ${assinationTuple.item2}'));
    //     var count2 = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK WHERE $COLUMN_TASK_ID == ${assinationTuple.item1}'));
    //     logger.i('${assinationTuple.item2}: $count1, ${assinationTuple.item1}: $count2');
    //     batch.insert(TABLE_ASSIGNATION, {COLUMN_ASSIGNEES_TASK_ID: assinationTuple.item1, COLUMN_ASSIGNEES_ASSIGNEE_ID: assinationTuple.item2});
    //   });
    //   batch.commit(noResult: true);
    // });

    taskAssignations.forEach((assinationTuple) async {
      var count1 = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $TABLE_USER WHERE $COLUMN_USER_ID == \"${assinationTuple.item2}\"'));
      var count2 = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK WHERE $COLUMN_TASK_ID == \"${assinationTuple.item1}\"'));
      logger.i('${assinationTuple.item2}: $count1, ${assinationTuple.item1}: $count2');
      db.insert(TABLE_ASSIGNATION, {COLUMN_ASSIGNEES_TASK_ID: assinationTuple.item1, COLUMN_ASSIGNEES_ASSIGNEE_ID: assinationTuple.item2});
    });
  }

  Future<void> close() async {
    final db = await database;
    logger.i('closing db');
    await db.close();
  }
}
