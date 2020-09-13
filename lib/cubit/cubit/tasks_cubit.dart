import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/model/task.dart';
import 'package:responsive_demo/repositories/task_repository.dart';

part 'tasks_state.dart';
part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TasksState> {
  final TaskRepository _taskRepository;

  TasksCubit(this._taskRepository) : super(Initial());

  Future<void> getTasks(taskId) async {
    try {
      emit(Loading());
      final tasks = await _taskRepository.getTasks(taskId);
      emit(Loaded(tasks));
    } on ApiClientException {
      emit(Error("Couldn't fetch tasks. Is the device online?"));
    }
  }
}
