import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/database/database.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:responsive_demo/repositories/mock_repositories_utils.dart';
import 'package:responsive_demo/repositories/task_repository.dart';
import 'package:uuid/uuid.dart';

class TaskRepositoryMock implements TaskRepository {
  @override
  Future<List<Task>> getTasks(int listId, {bool forceRefresh = false}) async {
    return get(tasksFilePath, deserializer: (json) {
      return (json['tasks'] as List).map((value) => Task.fromJson(value)).toList();
    }).then((taskList) => taskList.toStructuredList());
  }

  @override
  Future<Task> createTask(Task task, int listId) async {
    return task.copyWith(
      orderindex: "0",
      id: Uuid().v1().toString(),
    );
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
