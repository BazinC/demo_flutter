part of 'tasks_cubit.dart';

@freezed
abstract class TasksState with _$TasksState {
  const factory TasksState.inital() = Initial;
  const factory TasksState.loading() = Loading;
  const factory TasksState.loaded(List<Task> tasks) = Loaded;
  const factory TasksState.error(String message) = Error;
}
