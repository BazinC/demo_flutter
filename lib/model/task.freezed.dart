// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

class _$TaskTearOff {
  const _$TaskTearOff();

// ignore: unused_element
  _Task call(String id, String name, Status status, User creator,
      {String description,
      String text_content,
      List<User> assignees,
      List<User> watchers,
      String custom_id}) {
    return _Task(
      id,
      name,
      status,
      creator,
      description: description,
      text_content: text_content,
      assignees: assignees,
      watchers: watchers,
      custom_id: custom_id,
    );
  }
}

// ignore: unused_element
const $Task = _$TaskTearOff();

mixin _$Task {
  String get id;
  String get name;
  Status get status;
  User get creator;
  String get description;
  String get text_content;
  List<User> get assignees;
  List<User> get watchers;
  String get custom_id;

  Map<String, dynamic> toJson();
  $TaskCopyWith<Task> get copyWith;
}

abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      Status status,
      User creator,
      String description,
      String text_content,
      List<User> assignees,
      List<User> watchers,
      String custom_id});

  $StatusCopyWith<$Res> get status;
  $UserCopyWith<$Res> get creator;
}

class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object status = freezed,
    Object creator = freezed,
    Object description = freezed,
    Object text_content = freezed,
    Object assignees = freezed,
    Object watchers = freezed,
    Object custom_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      status: status == freezed ? _value.status : status as Status,
      creator: creator == freezed ? _value.creator : creator as User,
      description:
          description == freezed ? _value.description : description as String,
      text_content: text_content == freezed
          ? _value.text_content
          : text_content as String,
      assignees:
          assignees == freezed ? _value.assignees : assignees as List<User>,
      watchers: watchers == freezed ? _value.watchers : watchers as List<User>,
      custom_id: custom_id == freezed ? _value.custom_id : custom_id as String,
    ));
  }

  @override
  $StatusCopyWith<$Res> get status {
    if (_value.status == null) {
      return null;
    }
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $UserCopyWith<$Res> get creator {
    if (_value.creator == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value));
    });
  }
}

abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      Status status,
      User creator,
      String description,
      String text_content,
      List<User> assignees,
      List<User> watchers,
      String custom_id});

  @override
  $StatusCopyWith<$Res> get status;
  @override
  $UserCopyWith<$Res> get creator;
}

class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object status = freezed,
    Object creator = freezed,
    Object description = freezed,
    Object text_content = freezed,
    Object assignees = freezed,
    Object watchers = freezed,
    Object custom_id = freezed,
  }) {
    return _then(_Task(
      id == freezed ? _value.id : id as String,
      name == freezed ? _value.name : name as String,
      status == freezed ? _value.status : status as Status,
      creator == freezed ? _value.creator : creator as User,
      description:
          description == freezed ? _value.description : description as String,
      text_content: text_content == freezed
          ? _value.text_content
          : text_content as String,
      assignees:
          assignees == freezed ? _value.assignees : assignees as List<User>,
      watchers: watchers == freezed ? _value.watchers : watchers as List<User>,
      custom_id: custom_id == freezed ? _value.custom_id : custom_id as String,
    ));
  }
}

@JsonSerializable()
class _$_Task with DiagnosticableTreeMixin implements _Task {
  _$_Task(this.id, this.name, this.status, this.creator,
      {this.description,
      this.text_content,
      this.assignees,
      this.watchers,
      this.custom_id})
      : assert(id != null),
        assert(name != null),
        assert(status != null),
        assert(creator != null);

  factory _$_Task.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final Status status;
  @override
  final User creator;
  @override
  final String description;
  @override
  final String text_content;
  @override
  final List<User> assignees;
  @override
  final List<User> watchers;
  @override
  final String custom_id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task(id: $id, name: $name, status: $status, creator: $creator, description: $description, text_content: $text_content, assignees: $assignees, watchers: $watchers, custom_id: $custom_id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Task'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('creator', creator))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('text_content', text_content))
      ..add(DiagnosticsProperty('assignees', assignees))
      ..add(DiagnosticsProperty('watchers', watchers))
      ..add(DiagnosticsProperty('custom_id', custom_id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Task &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality()
                    .equals(other.creator, creator)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.text_content, text_content) ||
                const DeepCollectionEquality()
                    .equals(other.text_content, text_content)) &&
            (identical(other.assignees, assignees) ||
                const DeepCollectionEquality()
                    .equals(other.assignees, assignees)) &&
            (identical(other.watchers, watchers) ||
                const DeepCollectionEquality()
                    .equals(other.watchers, watchers)) &&
            (identical(other.custom_id, custom_id) ||
                const DeepCollectionEquality()
                    .equals(other.custom_id, custom_id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(creator) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(text_content) ^
      const DeepCollectionEquality().hash(assignees) ^
      const DeepCollectionEquality().hash(watchers) ^
      const DeepCollectionEquality().hash(custom_id);

  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskToJson(this);
  }
}

abstract class _Task implements Task {
  factory _Task(String id, String name, Status status, User creator,
      {String description,
      String text_content,
      List<User> assignees,
      List<User> watchers,
      String custom_id}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  Status get status;
  @override
  User get creator;
  @override
  String get description;
  @override
  String get text_content;
  @override
  List<User> get assignees;
  @override
  List<User> get watchers;
  @override
  String get custom_id;
  @override
  _$TaskCopyWith<_Task> get copyWith;
}
