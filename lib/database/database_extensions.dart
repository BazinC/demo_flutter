// Workarounds to define another mapping method, not allowed with freezed. useful for database helpers methods.
import 'package:responsive_demo/database/database.dart';
import 'package:responsive_demo/model/models.dart';

extension TaskExtension on Task {
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_TASK_ID: id,
      DatabaseProvider.COLUMN_TASK_NAME: name,
      DatabaseProvider.COLUMN_TASK_CREATOR_ID: creator.id,
      DatabaseProvider.COLUMN_TASK_DESCRIPTION: description,
      DatabaseProvider.COLUMN_TASK_TEXT_CONTENT: textContent,
      DatabaseProvider.COLUMN_TASK_STATUS_ID: status.status,
      DatabaseProvider.COLUMN_TASK_ORDER_INDEX: orderindex,
      DatabaseProvider.COLUMN_TASK_PARENT_ID: parent,
    };

    return map;
  }
}

extension UserExtension on User {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseProvider.COLUMN_USER_ID: id,
      DatabaseProvider.COLUMN_USER_NAME: username,
      DatabaseProvider.COLUMN_USER_COLOR: color,
      DatabaseProvider.COLUMN_USER_EMAIL: email,
      DatabaseProvider.COLUMN_USER_PROFILE_PICTURE: profilePicture,
      DatabaseProvider.COLUMN_USER_INITIALS: initials,
    };
  }
}

extension StatusExtension on Status {
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_STATUS_ID: status,
      DatabaseProvider.COLUMN_STATUS_COLOR: color,
      DatabaseProvider.COLUMN_STATUS_TYPE: type,
      DatabaseProvider.COLUMN_STATUS_ORDER_INDEX: orderindex,
    };

    return map;
  }
}
