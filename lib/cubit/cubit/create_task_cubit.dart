import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/globals.dart';
import 'package:responsive_demo/model/task.dart';
import 'package:responsive_demo/repositories/task_repository.dart';

part 'create_task_state.dart';
part 'create_task_cubit.freezed.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final TaskRepository _taskRepository;

  CreateTaskCubit(this._taskRepository) : super(Initial());

  Future<void> createTask(String name, {String description}) async {
    try {
      emit(Loading());
      final task = await _taskRepository.createTask(Task(name: name, description: description), defaultListID);
      emit(Success(task));
    } on ApiClientException catch (e) {
      emit(Error("Couldn't create task. (API error. $e)"));
    } on SocketException {
      emit(Error("Couldn't create task. Is the device online?"));
    } on TimeoutException {
      emit(Error("Couldn't create task. (Timeout) Is the device online?"));
    }
  }
}
