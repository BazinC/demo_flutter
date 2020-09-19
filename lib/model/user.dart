import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/database/database.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  factory User(
    int id,
    String username, {
    String color,
    String profilePicture,
    String email,
    String initials,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map[DatabaseProvider.COLUMN_USER_ID],
      map[DatabaseProvider.COLUMN_USER_NAME],
      color: map[DatabaseProvider.COLUMN_USER_COLOR],
      profilePicture: map[DatabaseProvider.COLUMN_USER_PROFILE_PICTURE],
      email: map[DatabaseProvider.COLUMN_USER_EMAIL],
      initials: map[DatabaseProvider.COLUMN_USER_INITIALS],
    );
  }
}
