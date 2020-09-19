part of 'status_cubit.dart';

@freezed
abstract class StatusState with _$StatusState {
  const factory StatusState.loaded(List<Status> status) = Loaded;
  const factory StatusState.error(String message, List<Status> status) = Error;
  const factory StatusState.initial() = Initial;
  const factory StatusState.loading(List<Status> status) = Loading;
}
