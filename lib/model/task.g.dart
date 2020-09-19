// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$_$_TaskFromJson(Map<String, dynamic> json) {
  return _$_Task(
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
    creator: json['creator'] == null
        ? null
        : User.fromJson(json['creator'] as Map<String, dynamic>),
    id: json['id'] as String,
    name: json['name'] as String,
    orderindex: json['orderindex'] as String,
    description: json['description'] as String,
    textContent: json['text_content'] as String,
    assignees: (json['assignees'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    watchers: (json['watchers'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    customId: json['custom_id'] as String,
    parent: json['parent'] as String,
    children: (json['children'] as List)
            ?.map((e) =>
                e == null ? null : Task.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'status': instance.status,
      'creator': instance.creator,
      'id': instance.id,
      'name': instance.name,
      'orderindex': instance.orderindex,
      'description': instance.description,
      'text_content': instance.textContent,
      'assignees': instance.assignees,
      'watchers': instance.watchers,
      'custom_id': instance.customId,
      'parent': instance.parent,
      'children': instance.children,
    };
