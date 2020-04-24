import 'package:dartz/dartz.dart';
import 'package:firebase_ddd_course/domain/auth/auth_failure.dart';
import 'package:firebase_ddd_course/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';

/// FirebaseAuth, Google Auth
abstract class IAuthFacade {
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
}