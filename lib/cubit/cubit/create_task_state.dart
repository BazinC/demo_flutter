part of 'create_task_cubit.dart';

@freezed
abstract class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState.initial() = Initial;
  const factory CreateTaskState.loading() = Loading;
  const factory CreateTaskState.error(String text) = Error;
  const factory CreateTaskState.success(Task task) = Success;
}
