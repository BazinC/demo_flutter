import 'package:responsive_demo/data_providers/api_client.dart';
import 'package:responsive_demo/database/database.dart';
import 'package:responsive_demo/globals.dart';
import 'package:responsive_demo/model/models.dart';

class StatusRepository {
  DatabaseProvider databaseProvider;

  Future<List<Status>> getStatusList() async {
    List<Status> result = [];
    result = await databaseProvider.getStatus();

    return result;
  }
}
