import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:responsive_demo/globals.dart';

const basePath = 'lib/stubs';
const String tasksFilePath = '$basePath/get_tasks.json';
const String statusFilePath = '$basePath/get_status.json';

Future<T> get<T>(
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
