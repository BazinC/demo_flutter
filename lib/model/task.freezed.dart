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
  _Task call(
      {Status status,
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
      List<Task> children = const <Task>[]}) {
    return _Task(
      status: status,
      creator: creator,
      id: id,
      name: name,
      orderindex: orderindex,
      description: description,
      textContent: textContent,
      assignees: assignees,
      watchers: watchers,
      customId: customId,
      parent: parent,
      children: children,
    );
  }
}

// ignore: unused_element
const $Task = _$TaskTearOff();

mixin _$Task {
  Status get status;
  User get creator;
  String get id;
  String get name;
  String get orderindex;
  String get description;
  @JsonKey(name: 'text_content')
  String get textContent;
  List<User> get assignees;
  List<User> get watchers;
  @JsonKey(name: 'custom_id')
  String get customId;
  String get parent;
  List<Task> get children;

  Map<String, dynamic> toJson();
  $TaskCopyWith<Task> get copyWith;
}

abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {Status status,
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
      List<Task> children});

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
    Object status = freezed,
    Object creator = freezed,
    Object id = freezed,
    Object name = freezed,
    Object orderindex = freezed,
    Object description = freezed,
    Object textContent = freezed,
    Object assignees = freezed,
    Object watchers = freezed,
    Object customId = freezed,
    Object parent = freezed,
    Object children = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as Status,
      creator: creator == freezed ? _value.creator : creator as User,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      orderindex:
          orderindex == freezed ? _value.orderindex : orderindex as String,
      description:
          description == freezed ? _value.description : description as String,
      textContent:
          textContent == freezed ? _value.textContent : textContent as String,
      assignees:
          assignees == freezed ? _value.assignees : assignees as List<User>,
      watchers: watchers == freezed ? _value.watchers : watchers as List<User>,
      customId: customId == freezed ? _value.customId : customId as String,
      parent: parent == freezed ? _value.parent : parent as String,
      children: children == freezed ? _value.children : children as List<Task>,
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
      {Status status,
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
      List<Task> children});

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
    Object status = freezed,
    Object creator = freezed,
    Object id = freezed,
    Object name = freezed,
    Object orderindex = freezed,
    Object description = freezed,
    Object textContent = freezed,
    Object assignees = freezed,
    Object watchers = freezed,
    Object customId = freezed,
    Object parent = freezed,
    Object children = freezed,
  }) {
    return _then(_Task(
      status: status == freezed ? _value.status : status as Status,
      creator: creator == freezed ? _value.creator : creator as User,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      orderindex:
          orderindex == freezed ? _value.orderindex : orderindex as String,
      description:
          description == freezed ? _value.description : description as String,
      textContent:
          textContent == freezed ? _value.textContent : textContent as String,
      assignees:
          assignees == freezed ? _value.assignees : assignees as List<User>,
      watchers: watchers == freezed ? _value.watchers : watchers as List<User>,
      customId: customId == freezed ? _value.customId : customId as String,
      parent: parent == freezed ? _value.parent : parent as String,
      children: children == freezed ? _value.children : children as List<Task>,
    ));
  }
}

@JsonSerializable()
class _$_Task with DiagnosticableTreeMixin implements _Task {
  _$_Task(
      {this.status,
      this.creator,
      this.id,
      this.name,
      this.orderindex,
      this.description,
      @JsonKey(name: 'text_content') this.textContent,
      this.assignees,
      this.watchers,
      @JsonKey(name: 'custom_id') this.customId,
      this.parent,
      this.children = const <Task>[]})
      : assert(children != null);

  factory _$_Task.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFromJson(json);

  @override
  final Status status;
  @override
  final User creator;
  @override
  final String id;
  @override
  final String name;
  @override
  final String orderindex;
  @override
  final String description;
  @override
  @JsonKey(name: 'text_content')
  final String textContent;
  @override
  final List<User> assignees;
  @override
  final List<User> watchers;
  @override
  @JsonKey(name: 'custom_id')
  final String customId;
  @override
  final String parent;
  @JsonKey(defaultValue: const <Task>[])
  @override
  final List<Task> children;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task(status: $status, creator: $creator, id: $id, name: $name, orderindex: $orderindex, description: $description, textContent: $textContent, assignees: $assignees, watchers: $watchers, customId: $customId, parent: $parent, children: $children)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Task'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('creator', creator))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('orderindex', orderindex))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('textContent', textContent))
      ..add(DiagnosticsProperty('assignees', assignees))
      ..add(DiagnosticsProperty('watchers', watchers))
      ..add(DiagnosticsProperty('customId', customId))
      ..add(DiagnosticsProperty('parent', parent))
      ..add(DiagnosticsProperty('children', children));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Task &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality()
                    .equals(other.creator, creator)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.orderindex, orderindex) ||
                const DeepCollectionEquality()
                    .equals(other.orderindex, orderindex)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.textContent, textContent) ||
                const DeepCollectionEquality()
                    .equals(other.textContent, textContent)) &&
            (identical(other.assignees, assignees) ||
                const DeepCollectionEquality()
                    .equals(other.assignees, assignees)) &&
            (identical(other.watchers, watchers) ||
                const DeepCollectionEquality()
                    .equals(other.watchers, watchers)) &&
            (identical(other.customId, customId) ||
                const DeepCollectionEquality()
                    .equals(other.customId, customId)) &&
            (identical(other.parent, parent) ||
                const DeepCollectionEquality().equals(other.parent, parent)) &&
            (identical(other.children, children) ||
                const DeepCollectionEquality()
                    .equals(other.children, children)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(creator) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(orderindex) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(textContent) ^
      const DeepCollectionEquality().hash(assignees) ^
      const DeepCollectionEquality().hash(watchers) ^
      const DeepCollectionEquality().hash(customId) ^
      const DeepCollectionEquality().hash(parent) ^
      const DeepCollectionEquality().hash(children);

  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskToJson(this);
  }
}

abstract class _Task implements Task {
  factory _Task(
      {Status status,
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
      List<Task> children}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  Status get status;
  @override
  User get creator;
  @override
  String get id;
  @override
  String get name;
  @override
  String get orderindex;
  @override
  String get description;
  @override
  @JsonKey(name: 'text_content')
  String get textContent;
  @override
  List<User> get assignees;
  @override
  List<User> get watchers;
  @override
  @JsonKey(name: 'custom_id')
  String get customId;
  @override
  String get parent;
  @override
  List<Task> get children;
  @override
  _$TaskCopyWith<_Task> get copyWith;
}
