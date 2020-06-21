part of 'note_actor_bloc.dart';

@freezed
abstract class NoteActorState with _$NoteActorState {
  const factory NoteActorState.initial() = _Initial;
  const factory NoteActorState.actionInProgress() = _ActionInProgress;
  const factory NoteActorState.deletedFailure(NoteFailure failure) = _DeletedFailure;
  const factory NoteActorState.deletedSuccess() = _DeletedSuccess;
}
