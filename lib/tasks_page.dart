import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_demo/cubit/cubit/tasks_cubit.dart';
import 'package:responsive_demo/dashboard_card.dart';
import 'package:responsive_demo/model/task.dart';
import 'package:responsive_demo/repositories/task_repository.dart';

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
    return ListView.builder(
        itemBuilder: (context, i) {
          final task = tasks[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DashboardCard(
              child: ListTile(title: Text(task.name)),
            ),
          );
        },
        itemCount: tasks.length);
  }
}
