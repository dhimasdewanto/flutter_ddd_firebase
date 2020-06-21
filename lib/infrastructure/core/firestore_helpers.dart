import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ddd_firebase/domain/auth/i_auth_facade.dart';
import 'package:flutter_ddd_firebase/domain/core/errors.dart';
import 'package:flutter_ddd_firebase/injection.dart';

extension FirestoreX on Firestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return Firestore.instance
        .collection('users')
        .document(user.id.valueOrCrash);
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get notesCollection => collection('notes');
}
