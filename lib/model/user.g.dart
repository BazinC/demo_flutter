// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    json['id'] as int,
    json['username'] as String,
    color: json['color'] as String,
    profilePicture: json['profilePicture'] as String,
    email: json['email'] as String,
    initials: json['initials'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'color': instance.color,
      'profilePicture': instance.profilePicture,
      'email': instance.email,
      'initials': instance.initials,
    };
