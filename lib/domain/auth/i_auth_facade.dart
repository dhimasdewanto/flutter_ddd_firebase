import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ddd_firebase/domain/auth/user.dart';

import 'auth_failure.dart';
import 'value_objects.dart';

/// FirebaseAuth, Google Auth
abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();

  /// Unit is void class type.
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required PasswordValue passwordValue,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required PasswordValue passwordValue,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Future<void> signOut();
}