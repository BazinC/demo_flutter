import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

import 'package:responsive_demo/model/models.dart';

import '../globals.dart';

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

const Duration _defaultTimeoutDuration = Duration(seconds: 3);
const String defaultPrivateApiKey = 'pk_4758571_GD33Z03NGQFFE7O90XQC2PNIF011FHLW';

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

  Future<List<Task>> getTasks(int listId, {bool includeSubstasks = true}) async {
    final flatTaskList =
        await _get<List<Task>>('/list/$listId/task', queryParameters: {'subtasks': includeSubstasks.toString()}, deserializer: (json) {
      // Workaround on Tasks API reponse.. On prod, the format is { "task" : { t1, t2, ...}} and on mock server the format is { t1, t2, ...}
      if (json is List) {
        return json.map((value) => Task.fromJson(value)).toList();
      } else if (json['tasks'] != null) {
        return (json['tasks'] as List).map((value) => Task.fromJson(value)).toList();
      } else
        return [];
    });

    return flatTaskList.toStructuredList();
  }

  Future<Task> createTask(Task task, int listId) {
    final taskJson = task.toJson();
    taskJson['status'] = task.status.status;

    return _post<Task>('/list/$listId/task', taskJson, deserializer: (json) => Task.fromJson(json));
  }

  Future<bool> deleteTask(Task task) async {
    await Future.delayed(Duration(seconds: 1));
    final result = await _delete('/task/${task.id}');
    return result;
  }

  Future<T> _get<T>(
    String url, {
    T Function(dynamic) deserializer,
    Map<String, String> queryParameters,
  }) async {
    final uri = _buildDefaultUri(url, queryParameters);
    logger.i('uri: $uri');

    final headers = _buildDefaultHeader();

    final response = await _client.get(uri, headers: headers).timeout(_defaultTimeoutDuration);
    print('$response');
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      return deserializer(json);
    } else {
      throw ApiClientException._(code: response.statusCode);
    }
  }

  Future<T> _post<T>(
    String url,
    Object body, {
    Map<String, String> queryParameters,
    T Function(dynamic) deserializer,
  }) async {
    final effectiveBody = body == null ? null : utf8.encode(json.encode(body));

    Map<String, String> headers = _buildDefaultHeader();

    final uri = _buildDefaultUri(url, queryParameters);

    final response = await _client.post(uri, headers: headers, body: effectiveBody).timeout(_defaultTimeoutDuration);
    print('$response');
    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      return deserializer(json);
    } else {
      throw ApiClientException._(code: response.statusCode);
    }
  }

  Future<bool> _delete<T>(String url) async {
    final headers = _buildDefaultHeader();
    final uri = _buildDefaultUri(url, null);

    final response = await _client.delete(uri, headers: headers).timeout(_defaultTimeoutDuration);
    print('$response');
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      throw ApiClientException._(code: response.statusCode);
    }
  }

  Uri _buildDefaultUri(String url, Map<String, String> queryParameters) {
    return Uri.https(
      _authority,
      '$_baseUrl$url',
      queryParameters,
    );
  }

  Map<String, String> _buildDefaultHeader() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: defaultPrivateApiKey,
    };
  }
}
