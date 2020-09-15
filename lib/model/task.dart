import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/database/database.dart';

import 'models.dart';

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

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      map[DatabaseProvider.COLUMN_TASK_ID],
      map[DatabaseProvider.COLUMN_TASK_NAME],
      Status(
        status: map[DatabaseProvider.COLUMN_STATUS_ID],
        color: map[DatabaseProvider.COLUMN_STATUS_COLOR],
        type: map[DatabaseProvider.COLUMN_STATUS_TYPE],
      ),
      User(
        map[DatabaseProvider.COLUMN_TASK_CREATOR_ID],
        map[DatabaseProvider.COLUMN_USER_NAME],
        color: map[DatabaseProvider.COLUMN_USER_COLOR],
        profilePicture: map[DatabaseProvider.COLUMN_USER_PROFILE_PICTURE],
        email: map[DatabaseProvider.COLUMN_USER_EMAIL],
        initials: map[DatabaseProvider.COLUMN_USER_EMAIL],
      ),
      description: map[DatabaseProvider.COLUMN_TASK_DESCRIPTION],
      text_content: map[DatabaseProvider.COLUMN_TASK_TEXT_CONTENT],
    );
  }
}

extension TaskExtension on Task {
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_TASK_NAME: name,
      DatabaseProvider.COLUMN_TASK_CREATOR_ID: creator.id,
      DatabaseProvider.COLUMN_TASK_DESCRIPTION: description,
      DatabaseProvider.COLUMN_TASK_TEXT_CONTENT: text_content,
      DatabaseProvider.COLUMN_TASK_STATUS_ID: status.status,
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_TASK_ID] = id;
    }

    return map;
  }
}
