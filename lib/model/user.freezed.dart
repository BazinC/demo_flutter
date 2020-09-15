// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(int id, String username,
      {String color, String profilePicture, String email, String initials}) {
    return _User(
      id,
      username,
      color: color,
      profilePicture: profilePicture,
      email: email,
      initials: initials,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  int get id;
  String get username;
  String get color;
  String get profilePicture;
  String get email;
  String get initials;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String username,
      String color,
      String profilePicture,
      String email,
      String initials});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object id = freezed,
    Object username = freezed,
    Object color = freezed,
    Object profilePicture = freezed,
    Object email = freezed,
    Object initials = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      username: username == freezed ? _value.username : username as String,
      color: color == freezed ? _value.color : color as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture as String,
      email: email == freezed ? _value.email : email as String,
      initials: initials == freezed ? _value.initials : initials as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String username,
      String color,
      String profilePicture,
      String email,
      String initials});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object id = freezed,
    Object username = freezed,
    Object color = freezed,
    Object profilePicture = freezed,
    Object email = freezed,
    Object initials = freezed,
  }) {
    return _then(_User(
      id == freezed ? _value.id : id as int,
      username == freezed ? _value.username : username as String,
      color: color == freezed ? _value.color : color as String,
      profilePicture: profilePicture == freezed
          ? _value.profilePicture
          : profilePicture as String,
      email: email == freezed ? _value.email : email as String,
      initials: initials == freezed ? _value.initials : initials as String,
    ));
  }
}

@JsonSerializable()
class _$_User implements _User {
  _$_User(this.id, this.username,
      {this.color, this.profilePicture, this.email, this.initials})
      : assert(id != null),
        assert(username != null);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String color;
  @override
  final String profilePicture;
  @override
  final String email;
  @override
  final String initials;

  @override
  String toString() {
    return 'User(id: $id, username: $username, color: $color, profilePicture: $profilePicture, email: $email, initials: $initials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.profilePicture, profilePicture) ||
                const DeepCollectionEquality()
                    .equals(other.profilePicture, profilePicture)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.initials, initials) ||
                const DeepCollectionEquality()
                    .equals(other.initials, initials)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(profilePicture) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(initials);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(int id, String username,
      {String color,
      String profilePicture,
      String email,
      String initials}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get color;
  @override
  String get profilePicture;
  @override
  String get email;
  @override
  String get initials;
  @override
  _$UserCopyWith<_User> get copyWith;
}
