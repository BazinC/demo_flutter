import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/model/task.dart';

part 'tasks.freezed.dart';
part 'tasks.g.dart';

@freezed
abstract class Tasks with _$Tasks {
  factory Tasks(List<Task> tasks) = _Tasks;

  factory Tasks.fromJson(Map<String, dynamic> json) => _$TasksFromJson(json);
}
