import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

import 'note.dart';
import 'note_failure.dart';

abstract class INoteRepository {
  Stream<Either<NoteFailure, KtList<Note>>> watchAll();
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted();
  Future<Either<NoteFailure, KtList<Note>>> create(Note note);
  Future<Either<NoteFailure, KtList<Note>>> update(Note note);
  Future<Either<NoteFailure, KtList<Note>>> delete(Note note);
}