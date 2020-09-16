// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

class _$StatusTearOff {
  const _$StatusTearOff();

// ignore: unused_element
  _Status call({String status, String color, String type, int orderindex}) {
    return _Status(
      status: status,
      color: color,
      type: type,
      orderindex: orderindex,
    );
  }
}

// ignore: unused_element
const $Status = _$StatusTearOff();

mixin _$Status {
  String get status;
  String get color;
  String get type;
  int get orderindex;

  Map<String, dynamic> toJson();
  $StatusCopyWith<Status> get copyWith;
}

abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res>;
  $Res call({String status, String color, String type, int orderindex});
}

class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  final Status _value;
  // ignore: unused_field
  final $Res Function(Status) _then;

  @override
  $Res call({
    Object status = freezed,
    Object color = freezed,
    Object type = freezed,
    Object orderindex = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as String,
      color: color == freezed ? _value.color : color as String,
      type: type == freezed ? _value.type : type as String,
      orderindex: orderindex == freezed ? _value.orderindex : orderindex as int,
    ));
  }
}

abstract class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) then) =
      __$StatusCopyWithImpl<$Res>;
  @override
  $Res call({String status, String color, String type, int orderindex});
}

class __$StatusCopyWithImpl<$Res> extends _$StatusCopyWithImpl<$Res>
    implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(_Status _value, $Res Function(_Status) _then)
      : super(_value, (v) => _then(v as _Status));

  @override
  _Status get _value => super._value as _Status;

  @override
  $Res call({
    Object status = freezed,
    Object color = freezed,
    Object type = freezed,
    Object orderindex = freezed,
  }) {
    return _then(_Status(
      status: status == freezed ? _value.status : status as String,
      color: color == freezed ? _value.color : color as String,
      type: type == freezed ? _value.type : type as String,
      orderindex: orderindex == freezed ? _value.orderindex : orderindex as int,
    ));
  }
}

@JsonSerializable()
class _$_Status implements _Status {
  _$_Status({this.status, this.color, this.type, this.orderindex});

  factory _$_Status.fromJson(Map<String, dynamic> json) =>
      _$_$_StatusFromJson(json);

  @override
  final String status;
  @override
  final String color;
  @override
  final String type;
  @override
  final int orderindex;

  @override
  String toString() {
    return 'Status(status: $status, color: $color, type: $type, orderindex: $orderindex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Status &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.orderindex, orderindex) ||
                const DeepCollectionEquality()
                    .equals(other.orderindex, orderindex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(orderindex);

  @override
  _$StatusCopyWith<_Status> get copyWith =>
      __$StatusCopyWithImpl<_Status>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StatusToJson(this);
  }
}

abstract class _Status implements Status {
  factory _Status({String status, String color, String type, int orderindex}) =
      _$_Status;

  factory _Status.fromJson(Map<String, dynamic> json) = _$_Status.fromJson;

  @override
  String get status;
  @override
  String get color;
  @override
  String get type;
  @override
  int get orderindex;
  @override
  _$StatusCopyWith<_Status> get copyWith;
}
