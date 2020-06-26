import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ddd_firebase/domain/notes/i_note_repository.dart';
import 'package:flutter_ddd_firebase/domain/notes/note_failure.dart';
import 'package:flutter_ddd_firebase/domain/notes/note.dart';
import 'package:flutter_ddd_firebase/infrastructure/notes/note_dtos.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

import '../../infrastructure/core/firestore_helpers.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  NoteRepository({@required this.firestore});

  final Firestore firestore;

  static const errorPermissionDenied = 'PERMISSION_DENIED';
  static const errorNotFound = 'NOT_FOUND';

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    final userDoc = await firestore.userDocument();
    yield* userDoc.notesCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.documents
                .map((doc) => NoteDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((exception) {
      if (exception is PlatformException &&
          exception.message.contains(errorPermissionDenied)) {
        return left(const NoteFailure.insufficientPermission());
      }

      /// You should log this part.
      return left(const NoteFailure.unexpected());
    });
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await firestore.userDocument();
    yield* userDoc.notesCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents.map(
            (doc) => NoteDto.fromFirestore(doc).toDomain(),
          ),
        )
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes
                .where((note) =>
                    note.todos.valueOrCrash.any((todoItem) => !todoItem.done))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((exception) {
      if (exception is PlatformException &&
          exception.message.contains(errorPermissionDenied)) {
        return left(const NoteFailure.insufficientPermission());
      }

      /// You should log this part.
      return left(const NoteFailure.unexpected());
    });
  }

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);

      await userDoc.notesCollection
          .document(noteDto.id)
          .setData(noteDto.toJson());

      return right(unit);
    } on PlatformException catch (error) {
      if (error.message.contains(errorPermissionDenied)) {
        return left(const NoteFailure.insufficientPermission());
      }

      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);

      await userDoc.notesCollection
          .document(noteDto.id)
          .updateData(noteDto.toJson());

      return right(unit);
    } on PlatformException catch (error) {
      if (error.message.contains(errorNotFound)) {
        return left(const NoteFailure.unableToUpdate());
      }

      if (error.message.contains(errorPermissionDenied)) {
        return left(const NoteFailure.insufficientPermission());
      }
      
      return left(const NoteFailure.unexpected());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await firestore.userDocument();
      final noteId = note.id.valueOrCrash;

      await userDoc.notesCollection
          .document(noteId)
          .delete();

      return right(unit);
    } on PlatformException catch (error) {
      if (error.message.contains(errorNotFound)) {
        return left(const NoteFailure.unableToDelete());
      }
      
      if (error.message.contains(errorPermissionDenied)) {
        return left(const NoteFailure.insufficientPermission());
      }

      return left(const NoteFailure.unexpected());
    }
  }
}
