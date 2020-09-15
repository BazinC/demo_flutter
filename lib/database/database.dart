import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:responsive_demo/globals.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  // TASK
  static const String TABLE_TASK = 'task';
  static const String COLUMN_TASK_ID = 'task_id';
  static const String COLUMN_TASK_NAME = 'task_name';
  static const String COLUMN_TASK_STATUS_ID = 'task_status_id';
  static const String COLUMN_TASK_CREATOR_ID = 'creator_id';
  static const String COLUMN_TASK_DESCRIPTION = 'task_description';
  static const String COLUMN_TASK_TEXT_CONTENT = 'task_text_content';
  static const String COLUMN_TASK_CUSTOM_ID = 'task_custom_id';

  // STATUS
  static const String TABLE_STATUS = 'status';
  static const String COLUMN_STATUS_ID = 'status';
  static const String COLUMN_STATUS_COLOR = 'color';
  static const String COLUMN_STATUS_TYPE = 'type';

  // USER
  static const String TABLE_USER = 'user';
  static const String COLUMN_USER_ID = 'id';
  static const String COLUMN_USER_NAME = 'username';
  static const String COLUMN_USER_COLOR = 'color';
  static const String COLUMN_USER_PROFILE_PICTURE = 'profilePicture';
  static const String COLUMN_USER_EMAIL = 'email';
  static const String COLUMN_USER_INITIALS = 'initials';

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    Sqflite.devSetDebugModeOn(true);

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

    await deleteDatabase(dbPath);

    return await openDatabase(
      dbPath,
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database database, int version) async {
    // CREATE USER TABLE
    await database.execute("CREATE TABLE $TABLE_USER ("
        "$COLUMN_USER_ID INTEGER NOT NULL PRIMARY KEY,"
        "$COLUMN_USER_NAME TEXT,"
        "$COLUMN_USER_COLOR TEXT,"
        "$COLUMN_USER_PROFILE_PICTURE TEXT,"
        "$COLUMN_USER_EMAIL TEXT,"
        "$COLUMN_USER_INITIALS TEXT)");

    // CREATE STATUS TABLE
    await database.execute("CREATE TABLE $TABLE_STATUS ("
        "$COLUMN_STATUS_ID TEXT NOT NULL PRIMARY KEY,"
        "$COLUMN_STATUS_COLOR TEXT,"
        "$COLUMN_STATUS_TYPE TEXT)");

    // CREATE TASK TABLE
    await database.execute('''CREATE TABLE $TABLE_TASK (
        $COLUMN_TASK_ID TEXT NOT NULL PRIMARY KEY,
        $COLUMN_TASK_NAME TEXT,
        $COLUMN_TASK_STATUS_ID TEXT,
        $COLUMN_TASK_CREATOR_ID INTEGER,
        $COLUMN_TASK_DESCRIPTION TEXT,
        $COLUMN_TASK_TEXT_CONTENT TEXT,
        $COLUMN_TASK_CUSTOM_ID TEXT,
        FOREIGN KEY ($COLUMN_TASK_CREATOR_ID) REFERENCES $TABLE_USER($COLUMN_USER_ID),
        FOREIGN KEY ($COLUMN_TASK_STATUS_ID) REFERENCES $TABLE_STATUS($COLUMN_STATUS_ID))''');

    // DUMMY DATA

    // await database.insert(
    //     TABLE_USER,
    //     User(
    //       11,
    //       'Corentin',
    //       color: '#a09d9d',
    //       profilePicture: 'profiletPicture',
    //       email: 'corentin.bazin@test.fr',
    //       initials: 'CB',
    //     ).toJson());

    // await database.insert(
    //     TABLE_STATUS,
    //     Status(
    //       status: 'TODO',
    //       color: '#a09d9d',
    //       type: 'azcac',
    //     ).toJson());

    // await database.insert(
    //     TABLE_TASK,
    //     Task(
    //         '012r',
    //         'Test',
    //         Status(status: 'TODO', color: '#a09d9d', type: 'custom'),
    //         User(
    //           11,
    //           'Corentin',
    //           color: '#a09d9d',
    //           profilePicture: 'profiletPicture',
    //           email: 'corentin.bazin@test.fr',
    //           initials: 'CB',
    //         )).toMap());
  }

  Future<List<Task>> getTasks() async {
    final db = await database;

    List<Task> taskList = List<Task>();
    var tasks = await db.rawQuery(
        '''SELECT * FROM $TABLE_TASK LEFT JOIN $TABLE_USER ON $TABLE_TASK.$COLUMN_TASK_CREATOR_ID == $TABLE_USER.$COLUMN_USER_ID LEFT JOIN $TABLE_STATUS ON $TABLE_TASK.$COLUMN_TASK_STATUS_ID == $TABLE_STATUS.$COLUMN_STATUS_ID''');
    // '''SELECT * FROM $TABLE_TASK''');
    // var tasks = await db.query(TABLE_TASK,
    //     columns: [COLUMN_TASK_ID, COLUMN_TASK_CREATOR_ID, COLUMN_TASK_CUSTOM_ID, COLUMN_TASK_TEXT_CONTENT, COLUMN_TASK_DESCRIPTION]);

    tasks.forEach((currentTask) {
      Task task = Task.fromMap(currentTask);

      taskList.add(task);
    });

    return taskList;
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final db = await database;

    // final user = tasks.

    // The easiest way but not the most optimized : erase all the data before saving new data
    // We avoid handling update references, new users, tasks..
    await db.transaction((txn) async {
      txn.execute('DELETE FROM $TABLE_TASK');
      txn.execute('DELETE FROM $TABLE_STATUS');
      txn.execute('DELETE FROM $TABLE_USER');

      var count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_STATUS'));
      logger.i('TABLE $TABLE_STATUS row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_USER'));
      logger.i('TABLE $TABLE_USER row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK'));
      logger.i('TABLE $TABLE_TASK row count : $count');

      final statusList = groupBy<Task, Status>(tasks, (Task task) => task.status).keys;
      final usersList = groupBy<Task, User>(tasks, (Task task) => task.creator).keys;

      final batch = txn.batch();

      for (Status status in statusList) {
        batch.insert(TABLE_STATUS, status.toJson());
      }
      for (User user in usersList) {
        batch.insert(TABLE_USER, user.toJson());
      }

      tasks.forEach((task) {
        batch.insert(TABLE_TASK, task.toMap());
      });

      await batch.commit(noResult: true);

      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_STATUS'));
      logger.i('TABLE $TABLE_STATUS row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_USER'));
      logger.i('TABLE $TABLE_USER row count : $count');
      count = Sqflite.firstIntValue(await txn.rawQuery('SELECT COUNT(*) FROM $TABLE_TASK'));
      logger.i('TABLE $TABLE_TASK row count : $count');
    });
  }
}
