// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tasks _$_$_TasksFromJson(Map<String, dynamic> json) {
  return _$_Tasks(
    (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_TasksToJson(_$_Tasks instance) => <String, dynamic>{
      'tasks': instance.tasks,
    };
