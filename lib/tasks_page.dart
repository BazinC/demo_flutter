import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/cubit/cubit/tasks_cubit.dart';
import 'package:responsive_demo/custom_theme.dart';
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
                  inital: () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('no data yet'), _ReloadButton()],
                  ),

                  // loading: (tasks) => _IdleTaskList(tasks: tasks),
                  loading: (tasks) => CircularProgressIndicator(),
                  // loading: (tasks) => _TaskList(
                  //   tasks: tasks,
                  //   key: ValueKey(defaultListID),
                  // ),
                  loaded: (tasks) => _TaskList(
                    tasks: tasks,
                    key: ValueKey(defaultListID),
                  ),
                  error: (text) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(text), _ReloadButton()],
                  ),
                )),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('reload'),
      onPressed: () => context.bloc<TasksCubit>().refreshTasks(defaultListID),
    );
  }
}

class _TaskList extends StatefulWidget {
  _TaskList({Key key, this.tasks}) : super(key: key);
  final List<Task> tasks;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<_TaskList> {
  final List<Task> tasks = <Task>[];

  @override
  void initState() {
    super.initState();
    initTaskList(widget.tasks);
  }

  void initTaskList(List<Task> taskList) {
    tasks.clear();
    tasks.addAll(taskList
      ..sort((taskB, taskA) {
        if (taskA.status.orderindex == taskB.status.orderindex) {
          return taskA.orderindex.compareTo(taskB.orderindex);
        }
        return taskA.status.orderindex.compareTo(taskB.status.orderindex);
      }));
  }

  @override
  void didUpdateWidget(_TaskList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.tasks != widget.tasks) {
      initTaskList(widget.tasks);
    }
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
        padding: EdgeInsets.symmetric(horizontal: 8),
        sort: false,
        // groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
        itemBuilder: (context, Task task) => _TaskRow(task: task),
        separator: SizedBox(
          height: 10,
        ));
  }
}

class _TaskRow extends StatefulWidget {
  const _TaskRow({
    Key key,
    this.task,
  }) : super(key: key);

  final Task task;

  @override
  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<_TaskRow> with SingleTickerProviderStateMixin {
  bool folded = false;

  @override
  Widget build(BuildContext context) {
    final assignees = (widget.task.assignees != null && widget.task.assignees.length > 0) ? widget.task.assignees : null;
    return GestureDetector(
      onTap: () {
        setState(() {
          folded = !folded;
        });
      },
      child: DashboardCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: widget.task.children.isNotEmpty,
                            child: Container(
                              // color: Colors.green,
                              child: AnimatedRotation(
                                rotated: !folded,
                                turns: 0.25,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: CustomTheme.of(context).primary.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                              child: Container(
                            // color: Colors.pink,
                            child: Text(widget.task.name),
                          )),
                        ],
                      ),
                    ),
                    assignees != null
                        ? Avatar(
                            clippingRadiusFactor: 0.5,
                            size: 40,
                            user: assignees?.first,
                          )
                        : SizedBox(
                            height: 40,
                            width: 40,
                          ),
                  ],
                ),
              ),
              if (widget.task.children.isNotEmpty)
                AnimatedSizeFactor(
                  fullSized: !folded,
                  child: _SubTaskList(
                    subtasks: widget.task.children,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _SubTaskList extends StatelessWidget {
  const _SubTaskList({Key key, this.subtasks}) : super(key: key);
  final List<Task> subtasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [...subtasks.map((subTask) => _SubTaskRow(subTask: subTask)).toList()],
    );
  }
}

class _SubTaskRow extends StatelessWidget {
  const _SubTaskRow({Key key, this.subTask}) : super(key: key);
  final Task subTask;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(subTask.name),
      ],
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
