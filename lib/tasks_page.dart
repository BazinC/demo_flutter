import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/cubit/cubit/tasks_cubit.dart';
import 'package:responsive_demo/dashboard_card.dart';
import 'package:responsive_demo/model/task.dart';
import 'package:responsive_demo/repositories/task_repository.dart';
import 'package:responsive_demo/widgets/avatar.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(Provider.of<TaskRepository>(context, listen: false))..getTasks(27886327),
      child: Center(
        child: BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) => state.when(
                  inital: () => RaisedButton(
                    child: Text('reload'),
                    onPressed: () => context.bloc<TasksCubit>().getTasks(27886327),
                  ),
                  loading: () => CircularProgressIndicator(),
                  loaded: (tasks) => _TaskList(tasks: tasks),
                  error: (text) => Text(text),
                )),
      ),
    );
  }
}

class _TaskList extends StatelessWidget {
  const _TaskList({Key key, this.tasks}) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Task, String>(
      elements: tasks,
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

class _Row extends StatelessWidget {
  const _Row({
    Key key,
    this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final assignees = (task.assignees?.length > 0) ? task.assignees : null;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DashboardCard(
        child: ListTile(
          title: Row(
            children: [
              assignees != null
                  ? Avatar(
                      clippingRadiusFactor: 0.5,
                      size: 40,
                      user: assignees.first,
                    )
                  : SizedBox.shrink(),
              Text(task.name),
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
