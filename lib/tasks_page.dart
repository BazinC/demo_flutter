import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/color_extention.dart';
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
        child: BlocConsumer<TasksCubit, TasksState>(
            listener: (context, state) {
              if (state is Error) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) => state.when(
                  inital: () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('no data yet'), _ReloadButton()],
                  ),

                  // loading: (tasks) => _IdleTaskList(tasks: tasks),
                  // loading: (tasks) => CircularProgressIndicator(),
                  loading: (tasks) => _TaskList(
                    tasks: tasks,
                    loading: true,
                    key: ValueKey(defaultListID),
                  ),
                  // loading: (tasks) => _TaskList(
                  //   tasks: tasks,
                  //   key: ValueKey(defaultListID),
                  // ),
                  loaded: (tasks) => _TaskList(
                    tasks: tasks,
                    key: ValueKey(defaultListID),
                  ),
                  error: (text, tasks) {
                    if (tasks != null && tasks.isNotEmpty) {
                      return _TaskList(
                        tasks: tasks,
                        key: ValueKey(defaultListID),
                      );
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text(text), _ReloadButton()],
                      );
                    }
                  },
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

class _TaskList extends StatelessWidget {
  final List<Task> tasks;
  final bool loading;

  const _TaskList({
    Key key,
    this.tasks,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GroupedListView<Task, String>(
            elements: tasks,
            groupBy: (task) => task.status.status,
            groupHeaderBuilder: (Task task) => _GroupHeader(
                  task: task,
                ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            sort: false,
            itemBuilder: (context, Task task) => _TaskRow(task: task, key: UniqueKey()),
            separator: SizedBox(
              height: 10,
            )),
        Visibility(
          visible: loading,
          child: Center(child: CircularProgressIndicator()),
        )
      ],
    );
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
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => context.bloc<TasksCubit>().deleteTask(widget.task),
        ),
      ],
      child: GestureDetector(
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
                Row(
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
                            child: AnimatedRotation(
                              rotated: !folded,
                              turns: 0.25,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: CustomTheme.of(context).primary.withOpacity(0.6),
                              ),
                            ),
                          ),
                          Flexible(child: Text(widget.task.name)),
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
                if (widget.task.children.isNotEmpty)
                  AnimatedOpacity(
                    duration: defaultAnimationDuration,
                    opacity: folded ? 1.0 : 0.0,
                    child: AnimatedSizeFactor(
                      fullSized: !folded,
                      child: _SubTaskList(
                        subtasks: widget.task.children,
                      ),
                    ),
                  )
              ],
            ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
              color: HexColor.fromHex(task.status.color),
              borderRadius: BorderRadius.circular(4.0),
            ),
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: Text(
              task.status.status.toUpperCase(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            )),
      ],
    );
  }
}
