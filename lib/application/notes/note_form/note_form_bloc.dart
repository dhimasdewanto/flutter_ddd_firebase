import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd_firebase/domain/notes/i_note_repository.dart';
import 'package:flutter_ddd_firebase/domain/notes/note.dart';
import 'package:flutter_ddd_firebase/domain/notes/note_failure.dart';
import 'package:flutter_ddd_firebase/domain/notes/value_objects.dart';
import 'package:flutter_ddd_firebase/presentation/notes/note_form/misc/to_do_item_presentation_classes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  NoteFormBloc({
    @required this.noteRepository,
  }) : super(
          NoteFormState.initial(),
        );

  final INoteRepository noteRepository;

  @override
  Stream<NoteFormState> mapEventToState(
    NoteFormEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.initialNoteOption.fold(
          /// It means yield nothing, because the state is same as previous state.
          () => state,
          (initialNote) => state.copyWith(
            note: initialNote,
            isEditing: true,
          ),
        );
      },
      bodyChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(
            body: NoteBody(e.body),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      colorChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(
            color: NoteColor(e.color),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      todosChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(
            todos: List3(
              e.todos.map((primitive) => primitive.toDomain()),
            ),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      saved: (e) async* {
        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        );

        Either<NoteFailure, Unit> failureOrSuccess;

        if (state.note.failureOption.isNone()) {
          failureOrSuccess = await _updateOrCreateNote();
        }

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }

  Future<Either<NoteFailure, Unit>> _updateOrCreateNote() async {
    if (state.isEditing) {
      return noteRepository.update(state.note);
    }
    return noteRepository.create(state.note);
  }
}
