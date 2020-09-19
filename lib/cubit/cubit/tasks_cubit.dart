import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
        tasks = await _taskRepository.getTasks(listId);
        loaded = true;
      }
      emit(Loaded(tasks));
    } on ApiClientException catch (e) {
      emit(Error("Couldn't fetch tasks. (API error. $e)"));
    } on SocketException {
      emit(Error("Couldn't fetch tasks. Is the device online?"));
    } on TimeoutException {
      emit(Error("Couldn't fetch tasks. (Timeout) Is the device online?"));
    }
  }

  Future<void> refreshTasks(listId) async {
    try {
      emit(Loading(tasks));
      tasks = await _taskRepository.getTasks(listId, forceRefresh: true);
      emit(Loaded(tasks));
    } on ApiClientException catch (e) {
      emit(Error("Couldn't fetch tasks. (API error. $e)"));
    } on SocketException {
      emit(Error("Couldn't fetch tasks. Is the device online?"));
    } on TimeoutException {
      emit(Error("Couldn't fetch tasks. (Timeout) Is the device online?"));
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      emit(Loading(tasks));
      final taskDeleted = await _taskRepository.deleteTask(task);
      if (taskDeleted) {
        emit(Loaded(tasks..remove(task)));
      } else {
        emit(Error("Failed to delete task"));
      }
    } on ApiClientException catch (e) {
      emit(Error("Failed to delete task. (API error. $e)"));
    } on SocketException {
      emit(Error("Failed to delete task. Is the device online?"));
    } on TimeoutException {
      emit(Error("Failed to delete task. (Timeout) Is the device online?"));
    }
  }
}
