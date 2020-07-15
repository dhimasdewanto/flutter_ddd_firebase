import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ddd_firebase/domain/notes/i_note_repository.dart';
import 'package:flutter_ddd_firebase/domain/notes/note.dart';
import 'package:flutter_ddd_firebase/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  NoteActorBloc({
    @required this.noteRepository,
  }) : super(
          const NoteActorState.initial(),
        );

  final INoteRepository noteRepository;

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    yield const NoteActorState.actionInProgress();
    final possibleFailure = await noteRepository.delete(event.note);
    yield possibleFailure.fold(
      (failure) => NoteActorState.deletedFailure(failure),
      (_) => const NoteActorState.deletedSuccess(),
    );
  }
}
