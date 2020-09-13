import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/model/task.dart';

class TaskRepository {
  ApiClient apiClient;

  Future<List<Task>> getTasks(int listId) {
    return apiClient.getTasks(listId);
  }
}
