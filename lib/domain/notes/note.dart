import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_firebase/domain/core/failures.dart';
import 'package:flutter_ddd_firebase/domain/core/value_objects.dart';
import 'package:flutter_ddd_firebase/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import 'todo_item.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const factory Note({
    @required UniqueId id,
    @required NoteBody body,
    @required NoteColor color,
    @required List3<ToDoItem> todos,
  }) = _Note;

  const Note._();

  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColor[0]),
        todos: List3(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    // andThen -> like flatMap
    // filter == where
    return body.failureOrUnit
        .andThen(todos.value)
        .andThen(todos.valueOrCrash
            .map((todoItem) => todoItem.failureOption)
            .filter((o) => o.isSome())
            .getOrElse(0, (_) => none())
            .fold(
              () => right(unit),
              (failure) => left(failure),
            ))
        .fold(
          (failure) => some(failure),
          (_) => none(),
        );
  }
}
