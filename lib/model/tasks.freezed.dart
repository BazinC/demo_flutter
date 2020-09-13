// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Tasks _$TasksFromJson(Map<String, dynamic> json) {
  return _Tasks.fromJson(json);
}

class _$TasksTearOff {
  const _$TasksTearOff();

// ignore: unused_element
  _Tasks call(List<Task> tasks) {
    return _Tasks(
      tasks,
    );
  }
}

// ignore: unused_element
const $Tasks = _$TasksTearOff();

mixin _$Tasks {
  List<Task> get tasks;

  Map<String, dynamic> toJson();
  $TasksCopyWith<Tasks> get copyWith;
}

abstract class $TasksCopyWith<$Res> {
  factory $TasksCopyWith(Tasks value, $Res Function(Tasks) then) =
      _$TasksCopyWithImpl<$Res>;
  $Res call({List<Task> tasks});
}

class _$TasksCopyWithImpl<$Res> implements $TasksCopyWith<$Res> {
  _$TasksCopyWithImpl(this._value, this._then);

  final Tasks _value;
  // ignore: unused_field
  final $Res Function(Tasks) _then;

  @override
  $Res call({
    Object tasks = freezed,
  }) {
    return _then(_value.copyWith(
      tasks: tasks == freezed ? _value.tasks : tasks as List<Task>,
    ));
  }
}

abstract class _$TasksCopyWith<$Res> implements $TasksCopyWith<$Res> {
  factory _$TasksCopyWith(_Tasks value, $Res Function(_Tasks) then) =
      __$TasksCopyWithImpl<$Res>;
  @override
  $Res call({List<Task> tasks});
}

class __$TasksCopyWithImpl<$Res> extends _$TasksCopyWithImpl<$Res>
    implements _$TasksCopyWith<$Res> {
  __$TasksCopyWithImpl(_Tasks _value, $Res Function(_Tasks) _then)
      : super(_value, (v) => _then(v as _Tasks));

  @override
  _Tasks get _value => super._value as _Tasks;

  @override
  $Res call({
    Object tasks = freezed,
  }) {
    return _then(_Tasks(
      tasks == freezed ? _value.tasks : tasks as List<Task>,
    ));
  }
}

@JsonSerializable()
class _$_Tasks implements _Tasks {
  _$_Tasks(this.tasks) : assert(tasks != null);

  factory _$_Tasks.fromJson(Map<String, dynamic> json) =>
      _$_$_TasksFromJson(json);

  @override
  final List<Task> tasks;

  @override
  String toString() {
    return 'Tasks(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Tasks &&
            (identical(other.tasks, tasks) ||
                const DeepCollectionEquality().equals(other.tasks, tasks)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tasks);

  @override
  _$TasksCopyWith<_Tasks> get copyWith =>
      __$TasksCopyWithImpl<_Tasks>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TasksToJson(this);
  }
}

abstract class _Tasks implements Tasks {
  factory _Tasks(List<Task> tasks) = _$_Tasks;

  factory _Tasks.fromJson(Map<String, dynamic> json) = _$_Tasks.fromJson;

  @override
  List<Task> get tasks;
  @override
  _$TasksCopyWith<_Tasks> get copyWith;
}
