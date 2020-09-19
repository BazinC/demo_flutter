import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:responsive_demo/repositories/status_repository.dart';

part 'status_state.dart';
part 'status_cubit.freezed.dart';

class StatusCubit extends Cubit<StatusState> {
  final StatusRepository _statusRepository;

  StatusCubit(this._statusRepository) : super(Initial());

  List<Status> statusList = [];
  bool loaded = false;

  Future<void> getStatusList() async {
    try {
      if (!loaded) {
        emit(Loading(statusList));
        statusList = await _statusRepository.getStatusList();
        loaded = true;
      }
      emit(Loaded(statusList));
    } on Exception catch (e) {
      emit(Error("Couldn't fetch tasks. (${e.toString()}) Is the device online?", statusList));
    }
  }
}
