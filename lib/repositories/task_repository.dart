import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/database/database.dart';
import 'package:responsive_demo/globals.dart';
import 'package:responsive_demo/model/models.dart';

class TaskRepository {
  ApiClient apiClient;
  DatabaseProvider databaseProvider;

  Future<List<Task>> getTasks(int listId, {bool forceRefresh = false}) async {
    List<Task> result = [];
    if (forceRefresh) {
      logger.i('getting tasks from API');
      result = await apiClient.getTasks(listId);
      await databaseProvider.saveTasks(result);
    } else {
      logger.i('getting tasks from database');
      result = await databaseProvider.getTasks();
      print('coucou');
      if (result.isEmpty) {
        logger.i('No records in database. Calling API');
        result = await apiClient.getTasks(listId);
        await databaseProvider.saveTasks(result);
      }
    }

    return result;
  }

  Future<Task> createTask(Task task, int listId) {
    return apiClient.createTask(task, listId);
  }

  Future<bool> deleteTask(Task task) {
    return apiClient.deleteTask(task);
  }
}
