import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:responsive_demo/repositories/task_repository.dart';

part 'tasks_state.dart';
part 'tasks_cubit.freezed.dart';

class TasksCubit extends Cubit<TasksState> {
  final TaskRepository _taskRepository;

  TasksCubit(this._taskRepository) : super(Initial());

  List<Task> tasks = [];
  bool loaded = false;

  Future<void> getTasks(listId) async {
    try {
      if (!loaded) {
        emit(Loading(tasks));
        tasks = await _taskRepository.getTasks(listId)
          ..sort(_taskCompare);
        loaded = true;
      }
      emit(Loaded(tasks));
    } on ApiClientException catch (e) {
      emit(Error("Couldn't fetch tasks. (API error. $e)", tasks));
    } on SocketException {
      emit(Error("Couldn't fetch tasks. Is the device online?", tasks));
    } on TimeoutException {
      emit(Error("Couldn't fetch tasks. (Timeout) Is the device online?", tasks));
    } on ClientException catch (e) {
      emit(Error("Couldn't fetch tasks. (Client exception: ${e.message}) Is the device online?", tasks));
    } on Exception catch (e) {
      emit(Error("Couldn't fetch tasks. (${e.toString()}) Is the device online?", tasks));
    }
  }

  Future<void> refreshTasks(listId) async {
    try {
      emit(Loading(tasks));
      tasks = await _taskRepository.getTasks(listId, forceRefresh: true);
      emit(Loaded(tasks..sort(_taskCompare)));
    } on ApiClientException catch (e) {
      emit(Error("Couldn't fetch tasks. (API error. $e)", tasks));
    } on SocketException {
      emit(Error("Couldn't fetch tasks. Is the device online?", tasks));
    } on TimeoutException {
      emit(Error("Couldn't fetch tasks. (Timeout) Is the device online?", tasks));
    } on ClientException catch (e) {
      emit(Error("Couldn't fetch tasks. (Client exception: ${e.message}) Is the device online?", tasks));
    } on Exception catch (e) {
      emit(Error("Couldn't fetch tasks. (${e.toString()}) Is the device online?", tasks));
    }
  }

  Future<void> createTask(String name, int listId, {String description, Status status}) async {
    try {
      emit(Loading(tasks));
      final task = await _taskRepository.createTask(Task(name: name, description: description, status: status), listId);
      emit(Loaded(tasks
        ..add(task)
        ..sort(_taskCompare)));
    } on ApiClientException catch (e) {
      emit(Error("Couldn't create task. (API error. $e)", tasks));
    } on SocketException {
      emit(Error("Couldn't create task. Is the device online?", tasks));
    } on TimeoutException {
      emit(Error("Couldn't create task. (Timeout) Is the device online?", tasks));
    } on ClientException catch (e) {
      emit(Error("Couldn't create task. (Client exception: ${e.message}) Is the device online?", tasks));
    } on Exception catch (e) {
      emit(Error("Couldn't create task. (${e.toString()}) Is the device online?", tasks));
    }
  }

  int _taskCompare(Task taskB, Task taskA) {
    if (taskA.status.orderindex == taskB.status.orderindex) {
      return taskA.orderindex.compareTo(taskB.orderindex);
    }
    return taskA.status.orderindex.compareTo(taskB.status.orderindex);
  }

  Future<void> deleteTask(Task task) async {
    try {
      emit(Loading(tasks));
      final taskDeleted = await _taskRepository.deleteTask(task);
      if (taskDeleted) {
        print('${tasks.length}');
        tasks = tasks
          ..remove(task)
          ..sort(_taskCompare);
        print('${tasks.length}');

        emit(Loaded(tasks));
      } else {
        emit(Error("Failed to delete task", tasks));
      }
    } on ApiClientException catch (e) {
      emit(Error("Failed to delete task. (API error. $e)", tasks));
    } on SocketException {
      emit(Error("Failed to delete task. Is the device online?", tasks));
    } on TimeoutException {
      emit(Error("Failed to delete task. (Timeout) Is the device online?", tasks));
    }
  }
}
