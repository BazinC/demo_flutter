import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/database/database.dart';
import 'package:responsive_demo/globals.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:responsive_demo/repositories/task_repository.dart';

class TaskRepositoryMock implements TaskRepository {
  static const basePath = 'lib/stubs';
  static const String tasksFilePath = '$basePath/get_tasks.json';

  Future<T> _get<T>(
    String filePath, {
    @required T Function(dynamic) deserializer,
  }) async {
    try {
      String data = await rootBundle.loadString(filePath);
      final decoded = jsonDecode(data);
      return deserializer(decoded);
    } on Exception catch (e) {
      logger.e(e);
    }
    return null;
  }

  @override
  Future<List<Task>> getTasks(int listId, {bool forceRefresh = false}) async {
    return _get(tasksFilePath, deserializer: (json) {
      return (json['tasks'] as List).map((value) => Task.fromJson(value)).toList();
    });
  }

  @override
  Future<Task> createTask(Task task, int listId) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTask(Task task) async {
    return true;
  }

  @override
  ApiClient apiClient;

  @override
  DatabaseProvider databaseProvider;
}
