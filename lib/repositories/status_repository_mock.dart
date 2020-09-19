import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/database/database.dart';
import 'package:responsive_demo/globals.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:responsive_demo/repositories/mock_repositories_utils.dart';
import 'package:responsive_demo/repositories/status_repository.dart';

class StatusRepositoryMock implements StatusRepository {
  DatabaseProvider databaseProvider;

  @override
  Future<List<Status>> getStatusList() async {
    return get(statusFilePath, deserializer: (json) {
      print('coucou');
      return (json as List).map<Status>((value) => Status.fromJson(value)).toList();
    });
  }
}
