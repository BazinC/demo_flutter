// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Status _$_$_StatusFromJson(Map<String, dynamic> json) {
  return _$_Status(
    status: json['status'] as String,
    color: json['color'] as String,
    type: json['type'] as String,
    orderindex: json['orderindex'] as int,
  );
}

Map<String, dynamic> _$_$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'status': instance.status,
      'color': instance.color,
      'type': instance.type,
      'orderindex': instance.orderindex,
    };
