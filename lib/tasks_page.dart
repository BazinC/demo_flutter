import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/cubit/cubit/tasks_cubit.dart';
import 'package:responsive_demo/dashboard_card.dart';
import 'package:responsive_demo/repositories/task_repository.dart';
import 'package:responsive_demo/widgets/animated_rotation.dart';
import 'package:responsive_demo/widgets/animated_size.dart';
import 'package:responsive_demo/widgets/avatar.dart';

import 'globals.dart';
import 'model/models.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RefreshIndicator(
        onRefresh: () async {
          await context.bloc<TasksCubit>().refreshTasks(defaultListID);
        },
        child: BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) => state.when(
                  inital: () => RaisedButton(
                    child: Text('reload'),
                    onPressed: () => context.bloc<TasksCubit>().getTasks(defaultListID),
                  ),
                  // loading: (tasks) => _IdleTaskList(tasks: tasks),
                  // loading: (tasks) => CircularProgressIndicator(),
                  loading: (tasks) => _HeroTaskList(
                    tasks: tasks,
                    key: ValueKey(defaultListID),
                  ),
                  loaded: (tasks) => _HeroTaskList(
                    tasks: tasks,
                    key: ValueKey(defaultListID),
                  ),
                  error: (text) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(text),
                      RaisedButton(
                        child: Text('reload'),
                        onPressed: () => context.bloc<TasksCubit>().getTasks(defaultListID),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}

class _HeroTaskList extends StatefulWidget {
  _HeroTaskList({Key key, this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  __HeroTaskListState createState() => __HeroTaskListState();
}

class __HeroTaskListState extends State<_HeroTaskList> {
  final List<Task> tasks = <Task>[];

  @override
  void initState() {
    super.initState();
    tasks.addAll(widget.tasks.take(30).toList()
      ..sort((taskB, taskA) {
        if (taskA.status.orderindex == taskB.status.orderindex) {
          return taskA.orderindex.compareTo(taskB.orderindex);
        }
        return taskA.status.orderindex.compareTo(taskB.status.orderindex);
      }));
  }

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Task, String>(
      // elements: widget.tasks,
      elements: tasks,
      groupBy: (task) => task.status.status,
      groupHeaderBuilder: (Task task) => _GroupHeader(
        task: task,
      ),
      sort: false,
      // groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
      itemBuilder: (context, Task task) => _Row(
        task: task,
      ),
    );
  }
}

class _TaskList extends StatefulWidget {
  const _TaskList({Key key, this.tasks, this.isLoading}) : super(key: key);

  final List<Task> tasks;
  final bool isLoading;

  @override
  __TaskListState createState() => __TaskListState();
}

class __TaskListState extends State<_TaskList> {
  @override
  Widget build(BuildContext context) {
    return GroupedListView<Task, String>(
      elements: widget.tasks,
      groupBy: (task) => task.status.status,
      groupHeaderBuilder: (Task task) => _GroupHeader(
        task: task,
      ),
      // groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
      itemBuilder: (context, Task task) => _Row(
        task: task,
      ),
      order: GroupedListOrder.ASC,
    );

    // ListView.builder(
    //     itemBuilder: (context, i) {
    //       final task = tasks[i];
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: DashboardCard(
    //           child: ListTile(title: Text(task.name)),
    //         ),
    //       );
    //     },
    //     itemCount: tasks.length);
  }
}

class _Row extends StatefulWidget {
  const _Row({
    Key key,
    this.task,
  }) : super(key: key);

  final Task task;

  @override
  __RowState createState() => __RowState();
}

class __RowState extends State<_Row> with SingleTickerProviderStateMixin {
  bool folded = false;

  @override
  Widget build(BuildContext context) {
    final assignees = (widget.task.assignees != null && widget.task.assignees.length > 0) ? widget.task.assignees : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DashboardCard(
        child: ListTile(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: widget.task.children.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          folded = !folded;
                        });
                      },
                      child: AnimatedRotation(
                        rotated: !folded,
                        turns: 0.25,
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                  Flexible(child: Text(widget.task.name)),
                  assignees != null
                      ? Avatar(
                          clippingRadiusFactor: 0.5,
                          size: 40,
                          user: assignees?.first,
                        )
                      : SizedBox.shrink(),
                ],
              ),
              AnimatedSizeFactor(
                fullSized: !folded,
                child: Column(children: [
                  Text('test'),
                  Text('test'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({
    Key key,
    this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Container(
              color: HexColor.fromHex(task.status.color),
              child: Text(
                task.status.status,
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}

Color _statusColorToColor(Task task) {
  final res = int.parse(task.status.color);
  return Color(res);
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
