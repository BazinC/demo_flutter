// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dashboard_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DashboardCardThemeDataTearOff {
  const _$DashboardCardThemeDataTearOff();

// ignore: unused_element
  _DashboardCardThemeData call({Color backgroundColor, Color shadowColor}) {
    return _DashboardCardThemeData(
      backgroundColor: backgroundColor,
      shadowColor: shadowColor,
    );
  }
}

// ignore: unused_element
const $DashboardCardThemeData = _$DashboardCardThemeDataTearOff();

mixin _$DashboardCardThemeData {
  Color get backgroundColor;
  Color get shadowColor;

  $DashboardCardThemeDataCopyWith<DashboardCardThemeData> get copyWith;
}

abstract class $DashboardCardThemeDataCopyWith<$Res> {
  factory $DashboardCardThemeDataCopyWith(DashboardCardThemeData value,
          $Res Function(DashboardCardThemeData) then) =
      _$DashboardCardThemeDataCopyWithImpl<$Res>;
  $Res call({Color backgroundColor, Color shadowColor});
}

class _$DashboardCardThemeDataCopyWithImpl<$Res>
    implements $DashboardCardThemeDataCopyWith<$Res> {
  _$DashboardCardThemeDataCopyWithImpl(this._value, this._then);

  final DashboardCardThemeData _value;
  // ignore: unused_field
  final $Res Function(DashboardCardThemeData) _then;

  @override
  $Res call({
    Object backgroundColor = freezed,
    Object shadowColor = freezed,
  }) {
    return _then(_value.copyWith(
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as Color,
      shadowColor:
          shadowColor == freezed ? _value.shadowColor : shadowColor as Color,
    ));
  }
}

abstract class _$DashboardCardThemeDataCopyWith<$Res>
    implements $DashboardCardThemeDataCopyWith<$Res> {
  factory _$DashboardCardThemeDataCopyWith(_DashboardCardThemeData value,
          $Res Function(_DashboardCardThemeData) then) =
      __$DashboardCardThemeDataCopyWithImpl<$Res>;
  @override
  $Res call({Color backgroundColor, Color shadowColor});
}

class __$DashboardCardThemeDataCopyWithImpl<$Res>
    extends _$DashboardCardThemeDataCopyWithImpl<$Res>
    implements _$DashboardCardThemeDataCopyWith<$Res> {
  __$DashboardCardThemeDataCopyWithImpl(_DashboardCardThemeData _value,
      $Res Function(_DashboardCardThemeData) _then)
      : super(_value, (v) => _then(v as _DashboardCardThemeData));

  @override
  _DashboardCardThemeData get _value => super._value as _DashboardCardThemeData;

  @override
  $Res call({
    Object backgroundColor = freezed,
    Object shadowColor = freezed,
  }) {
    return _then(_DashboardCardThemeData(
      backgroundColor: backgroundColor == freezed
          ? _value.backgroundColor
          : backgroundColor as Color,
      shadowColor:
          shadowColor == freezed ? _value.shadowColor : shadowColor as Color,
    ));
  }
}

class _$_DashboardCardThemeData implements _DashboardCardThemeData {
  const _$_DashboardCardThemeData({this.backgroundColor, this.shadowColor});

  @override
  final Color backgroundColor;
  @override
  final Color shadowColor;

  @override
  String toString() {
    return 'DashboardCardThemeData(backgroundColor: $backgroundColor, shadowColor: $shadowColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DashboardCardThemeData &&
            (identical(other.backgroundColor, backgroundColor) ||
                const DeepCollectionEquality()
                    .equals(other.backgroundColor, backgroundColor)) &&
            (identical(other.shadowColor, shadowColor) ||
                const DeepCollectionEquality()
                    .equals(other.shadowColor, shadowColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(backgroundColor) ^
      const DeepCollectionEquality().hash(shadowColor);

  @override
  _$DashboardCardThemeDataCopyWith<_DashboardCardThemeData> get copyWith =>
      __$DashboardCardThemeDataCopyWithImpl<_DashboardCardThemeData>(
          this, _$identity);
}

abstract class _DashboardCardThemeData implements DashboardCardThemeData {
  const factory _DashboardCardThemeData(
      {Color backgroundColor, Color shadowColor}) = _$_DashboardCardThemeData;

  @override
  Color get backgroundColor;
  @override
  Color get shadowColor;
  @override
  _$DashboardCardThemeDataCopyWith<_DashboardCardThemeData> get copyWith;
}
