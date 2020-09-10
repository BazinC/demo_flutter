// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'custom_theme.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CustomThemeDataTearOff {
  const _$CustomThemeDataTearOff();

// ignore: unused_element
  _CustomThemeData call(
      {Color primary,
      Color background,
      Color secondaryBackground,
      Color secondaryShadow,
      @required Duration transitionDuration}) {
    return _CustomThemeData(
      primary: primary,
      background: background,
      secondaryBackground: secondaryBackground,
      secondaryShadow: secondaryShadow,
      transitionDuration: transitionDuration,
    );
  }
}

// ignore: unused_element
const $CustomThemeData = _$CustomThemeDataTearOff();

mixin _$CustomThemeData {
  Color get primary;
  Color get background;
  Color get secondaryBackground;
  Color get secondaryShadow;
  Duration get transitionDuration;

  $CustomThemeDataCopyWith<CustomThemeData> get copyWith;
}

abstract class $CustomThemeDataCopyWith<$Res> {
  factory $CustomThemeDataCopyWith(
          CustomThemeData value, $Res Function(CustomThemeData) then) =
      _$CustomThemeDataCopyWithImpl<$Res>;
  $Res call(
      {Color primary,
      Color background,
      Color secondaryBackground,
      Color secondaryShadow,
      Duration transitionDuration});
}

class _$CustomThemeDataCopyWithImpl<$Res>
    implements $CustomThemeDataCopyWith<$Res> {
  _$CustomThemeDataCopyWithImpl(this._value, this._then);

  final CustomThemeData _value;
  // ignore: unused_field
  final $Res Function(CustomThemeData) _then;

  @override
  $Res call({
    Object primary = freezed,
    Object background = freezed,
    Object secondaryBackground = freezed,
    Object secondaryShadow = freezed,
    Object transitionDuration = freezed,
  }) {
    return _then(_value.copyWith(
      primary: primary == freezed ? _value.primary : primary as Color,
      background:
          background == freezed ? _value.background : background as Color,
      secondaryBackground: secondaryBackground == freezed
          ? _value.secondaryBackground
          : secondaryBackground as Color,
      secondaryShadow: secondaryShadow == freezed
          ? _value.secondaryShadow
          : secondaryShadow as Color,
      transitionDuration: transitionDuration == freezed
          ? _value.transitionDuration
          : transitionDuration as Duration,
    ));
  }
}

abstract class _$CustomThemeDataCopyWith<$Res>
    implements $CustomThemeDataCopyWith<$Res> {
  factory _$CustomThemeDataCopyWith(
          _CustomThemeData value, $Res Function(_CustomThemeData) then) =
      __$CustomThemeDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {Color primary,
      Color background,
      Color secondaryBackground,
      Color secondaryShadow,
      Duration transitionDuration});
}

class __$CustomThemeDataCopyWithImpl<$Res>
    extends _$CustomThemeDataCopyWithImpl<$Res>
    implements _$CustomThemeDataCopyWith<$Res> {
  __$CustomThemeDataCopyWithImpl(
      _CustomThemeData _value, $Res Function(_CustomThemeData) _then)
      : super(_value, (v) => _then(v as _CustomThemeData));

  @override
  _CustomThemeData get _value => super._value as _CustomThemeData;

  @override
  $Res call({
    Object primary = freezed,
    Object background = freezed,
    Object secondaryBackground = freezed,
    Object secondaryShadow = freezed,
    Object transitionDuration = freezed,
  }) {
    return _then(_CustomThemeData(
      primary: primary == freezed ? _value.primary : primary as Color,
      background:
          background == freezed ? _value.background : background as Color,
      secondaryBackground: secondaryBackground == freezed
          ? _value.secondaryBackground
          : secondaryBackground as Color,
      secondaryShadow: secondaryShadow == freezed
          ? _value.secondaryShadow
          : secondaryShadow as Color,
      transitionDuration: transitionDuration == freezed
          ? _value.transitionDuration
          : transitionDuration as Duration,
    ));
  }
}

class _$_CustomThemeData implements _CustomThemeData {
  const _$_CustomThemeData(
      {this.primary,
      this.background,
      this.secondaryBackground,
      this.secondaryShadow,
      @required this.transitionDuration})
      : assert(transitionDuration != null);

  @override
  final Color primary;
  @override
  final Color background;
  @override
  final Color secondaryBackground;
  @override
  final Color secondaryShadow;
  @override
  final Duration transitionDuration;

  @override
  String toString() {
    return 'CustomThemeData(primary: $primary, background: $background, secondaryBackground: $secondaryBackground, secondaryShadow: $secondaryShadow, transitionDuration: $transitionDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CustomThemeData &&
            (identical(other.primary, primary) ||
                const DeepCollectionEquality()
                    .equals(other.primary, primary)) &&
            (identical(other.background, background) ||
                const DeepCollectionEquality()
                    .equals(other.background, background)) &&
            (identical(other.secondaryBackground, secondaryBackground) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryBackground, secondaryBackground)) &&
            (identical(other.secondaryShadow, secondaryShadow) ||
                const DeepCollectionEquality()
                    .equals(other.secondaryShadow, secondaryShadow)) &&
            (identical(other.transitionDuration, transitionDuration) ||
                const DeepCollectionEquality()
                    .equals(other.transitionDuration, transitionDuration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(primary) ^
      const DeepCollectionEquality().hash(background) ^
      const DeepCollectionEquality().hash(secondaryBackground) ^
      const DeepCollectionEquality().hash(secondaryShadow) ^
      const DeepCollectionEquality().hash(transitionDuration);

  @override
  _$CustomThemeDataCopyWith<_CustomThemeData> get copyWith =>
      __$CustomThemeDataCopyWithImpl<_CustomThemeData>(this, _$identity);
}

abstract class _CustomThemeData implements CustomThemeData {
  const factory _CustomThemeData(
      {Color primary,
      Color background,
      Color secondaryBackground,
      Color secondaryShadow,
      @required Duration transitionDuration}) = _$_CustomThemeData;

  @override
  Color get primary;
  @override
  Color get background;
  @override
  Color get secondaryBackground;
  @override
  Color get secondaryShadow;
  @override
  Duration get transitionDuration;
  @override
  _$CustomThemeDataCopyWith<_CustomThemeData> get copyWith;
}
