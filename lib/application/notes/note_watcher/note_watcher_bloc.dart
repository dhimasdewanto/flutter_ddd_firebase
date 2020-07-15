import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_ddd_firebase/domain/notes/i_note_repository.dart';
import 'package:flutter_ddd_firebase/domain/notes/note.dart';
import 'package:flutter_ddd_firebase/domain/notes/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

part 'note_watcher_event.dart';
part 'note_watcher_state.dart';
part 'note_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  NoteWatcherBloc({
    @required this.noteRepository,
  }) : super(
          const NoteWatcherState.initial(),
        );

  final INoteRepository noteRepository;

  StreamSubscription<Either<NoteFailure, KtList<Note>>> _noteStreamSubscribtion;

  @override
  Stream<NoteWatcherState> mapEventToState(
    NoteWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const NoteWatcherState.loadInProgress();

        /// Cancel subscription if active. Use ? if not created yet.
        await _noteStreamSubscribtion?.cancel();

        _noteStreamSubscribtion = noteRepository.watchAll().listen(
            (failureOrNotes) =>
                add(NoteWatcherEvent.notesReceived(failureOrNotes)));
      },
      watchUncompletedStarted: (e) async* {
        yield const NoteWatcherState.loadInProgress();

        /// Cancel subscription if active. Use ? if not created yet.
        await _noteStreamSubscribtion?.cancel();

        _noteStreamSubscribtion = noteRepository.watchUncompleted().listen(
            (failureOrNotes) =>
                add(NoteWatcherEvent.notesReceived(failureOrNotes)));
      },
      notesReceived: (e) async* {
        yield e.failureOrNotes.fold(
          (failure) => NoteWatcherState.loadFailure(failure),
          (notes) => NoteWatcherState.loadSuccess(notes),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    /// Cancel subscription if active. Use ? if not created yet.
    await _noteStreamSubscribtion?.cancel();
    return super.close();
  }
}
