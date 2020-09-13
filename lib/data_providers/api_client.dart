import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

import 'package:responsive_demo/model/task.dart';
import 'package:responsive_demo/model/tasks.dart';

/// The exception thrown when a called to the API has
/// not been successful.
class ApiClientException implements Exception {
  ApiClientException._({
    this.message,
    @required this.code,
  });

  /// The message returned by the API.
  final String message;

  /// The HTTP status code of the response.
  final int code;
}

/// A provider that fetches data from an API.
class ApiClient {
  /// Creates a new [ApiClient].
  ApiClient({
    Client client,
  }) : _client = client ?? Client();

  final Client _client;

  // In a real app, we should use a config.
  static const _authority = kIsWeb ? 'private-anon-e7331ead75-clickup20.apiary-mock.com' : 'api.clickup.com';
  static const _baseUrl = '/api/v2';

  Future<Task> getTask(String taskId) {
    print('getTask');
    return _get('/task/$taskId/', deserializer: (json) => Task.fromJson(json));
  }

  Future<List<Task>> getTasks(int listId) {
    return _get('/list/$listId/task', deserializer: (json) {
      // Workaround on Tasks API reponse.. On prod, the format is { "task" : { t1, t2, ...}} and on mock server the format is { t1, t2, ...}
      if (json is List) {
        return json.map((value) => Task.fromJson(value)).toList();
      } else if (json['tasks'] != null) {
        return (json['tasks'] as List).map((value) => Task.fromJson(value)).toList();
      } else
        return [];
    });
  }

  Future<T> _get<T>(
    String url, {
    T Function(dynamic) deserializer,
    Map<String, String> queryParameters,
  }) async {
    final uri = Uri.https(
      _authority,
      '$_baseUrl$url',
      queryParameters,
    );

    print('uri: $uri');

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    headers[HttpHeaders.authorizationHeader] = 'pk_4758571_GD33Z03NGQFFE7O90XQC2PNIF011FHLW';

    final response = await _client.get(uri, headers: headers);
    print('$response');
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      return deserializer(json);
    } else {
      throw ApiClientException._(code: response.statusCode);
    }
  }
}
