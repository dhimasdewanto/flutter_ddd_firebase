// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDto _$_$_NoteDtoFromJson(Map<String, dynamic> json) {
  return _$_NoteDto(
    body: json['body'] as String,
    color: json['color'] as int,
    todos: (json['todos'] as List)
        ?.map((e) =>
            e == null ? null : ToDoItemDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serverTimeStamp:
        const ServerStampConverter().fromJson(json['serverTimeStamp']),
  );
}

Map<String, dynamic> _$_$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'todos': instance.todos,
      'serverTimeStamp':
          const ServerStampConverter().toJson(instance.serverTimeStamp),
    };

_$_ToDoItemDto _$_$_ToDoItemDtoFromJson(Map<String, dynamic> json) {
  return _$_ToDoItemDto(
    id: json['id'] as String,
    name: json['name'] as String,
    done: json['done'] as bool,
  );
}

Map<String, dynamic> _$_$_ToDoItemDtoToJson(_$_ToDoItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
    };
