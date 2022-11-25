// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      title: json['title'] as String,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.active,
      id: const _UuidOrNullConverter().fromJson(json['id'] as String?),
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'title': instance.title,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'id': const _UuidOrNullConverter().toJson(instance.id),
    };

const _$TaskStatusEnumMap = {
  TaskStatus.active: 'active',
  TaskStatus.done: 'done',
};
