import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_firebase/domain/core/value_objects.dart';
import 'package:flutter_ddd_firebase/domain/notes/note.dart';
import 'package:flutter_ddd_firebase/domain/notes/todo_item.dart';
import 'package:flutter_ddd_firebase/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'note_dtos.freezed.dart';
part 'note_dtos.g.dart';

/// Note Data Transfer Object
@freezed
abstract class NoteDto implements _$NoteDto {
  const factory NoteDto({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<ToDoItemDto> todos,
    // Placeholder --> Time on the server
    @required @ServerStampConverter() FieldValue serverTimeStamp,
  }) = _NoteDto;

  const NoteDto._();

  factory NoteDto.fromDomain(Note note) {
    return NoteDto(
      id: note.id.valueOrCrash,
      body: note.body.valueOrCrash,
      color: note.color.valueOrCrash.value,
      todos: note.todos.valueOrCrash
          .map((todo) => ToDoItemDto.fromDomain(todo))
          .asList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(todos.map((dto) => dto.toDomain()).toImmutableList()),
    );
  }

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  factory NoteDto.fromFirestore(DocumentSnapshot doc) {
    return NoteDto.fromJson(doc.data).copyWith(id: doc.documentID);
  }
}

@freezed
abstract class ToDoItemDto implements _$ToDoItemDto {
  const factory ToDoItemDto({
    @required String id,
    @required String name,
    @required bool done,
  }) = _ToDoItemDto;

  const ToDoItemDto._();

  factory ToDoItemDto.fromDomain(ToDoItem todoItem) {
    return ToDoItemDto(
      id: todoItem.id.valueOrCrash,
      name: todoItem.name.valueOrCrash,
      done: todoItem.done,
    );
  }

  ToDoItem toDomain() {
    return ToDoItem(
      id: UniqueId.fromUniqueString(id),
      name: ToDoName(name),
      done: done,
    );
  }

  factory ToDoItemDto.fromJson(Map<String, dynamic> json) =>
      _$ToDoItemDtoFromJson(json);
}

class ServerStampConverter implements JsonConverter<FieldValue, Object> {
  const ServerStampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
