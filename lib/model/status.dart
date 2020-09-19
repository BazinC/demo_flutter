import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_demo/database/database.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
abstract class Status with _$Status {
  factory Status({
    String status,
    String color,
    String type,
    int orderindex,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      status: map[DatabaseProvider.COLUMN_STATUS_ID],
      color: map[DatabaseProvider.COLUMN_STATUS_COLOR],
      type: map[DatabaseProvider.COLUMN_STATUS_TYPE],
      orderindex: map[DatabaseProvider.COLUMN_STATUS_ORDER_INDEX],
    );
  }
}
