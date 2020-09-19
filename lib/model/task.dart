import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/database/database.dart';

import 'models.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  factory Task({
    Status status,
    User creator,
    String id,
    String name,
    String orderindex,
    String description,
    @JsonKey(name: 'text_content') String textContent,
    List<User> assignees,
    List<User> watchers,
    @JsonKey(name: 'custom_id') String customId,
    String parent,
    @Default(<Task>[]) List<Task> children,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map[DatabaseProvider.COLUMN_TASK_ID],
      name: map[DatabaseProvider.COLUMN_TASK_NAME],
      status: Status(
        status: map[DatabaseProvider.COLUMN_STATUS_ID],
        color: map[DatabaseProvider.COLUMN_STATUS_COLOR],
        type: map[DatabaseProvider.COLUMN_STATUS_TYPE],
        orderindex: map[DatabaseProvider.COLUMN_STATUS_ORDER_INDEX],
      ),
      creator: User.fromMap(map),
      // User(
      //   map[DatabaseProvider.COLUMN_TASK_CREATOR_ID],
      //   map[DatabaseProvider.COLUMN_USER_NAME],
      //   color: map[DatabaseProvider.COLUMN_USER_COLOR],
      //   profilePicture: map[DatabaseProvider.COLUMN_USER_PROFILE_PICTURE],
      //   email: map[DatabaseProvider.COLUMN_USER_EMAIL],
      //   initials: map[DatabaseProvider.COLUMN_USER_EMAIL],
      // ),
      description: map[DatabaseProvider.COLUMN_TASK_DESCRIPTION],
      textContent: map[DatabaseProvider.COLUMN_TASK_TEXT_CONTENT],
      orderindex: map[DatabaseProvider.COLUMN_TASK_ORDER_INDEX],
      parent: map[DatabaseProvider.COLUMN_TASK_PARENT_ID],
      children: <Task>[],
      assignees: <User>[],
    );
  }
}

extension SubtaskExtension on List<Task> {
  /// returns a new list of parent tasks where each task contains its subtasks.
  List<Task> toStructuredList() {
    final tasksWithNestedSubtasks = List<Task>.from(this);

    this.forEach((task) {
      if (task.parent != null) {
        final parent = tasksWithNestedSubtasks.where((parent) => parent.id == task.parent).first;
        if (parent != null) {
          parent.children.add(task.copyWith());
          tasksWithNestedSubtasks.removeWhere((e) => e.id == task.id);
        }
      }
    });

    return tasksWithNestedSubtasks;
  }
}
