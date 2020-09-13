import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/model/status.dart';
import 'package:responsive_demo/model/user.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  factory Task(
    String id,
    String name,
    Status status,
    User creator, {
    String description,
    String text_content,
    List<User> assignees,
    List<User> watchers,
    String custom_id,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
