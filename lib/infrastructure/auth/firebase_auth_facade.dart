import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';
import '../../domain/auth/value_objects.dart';
import 'firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  FirebaseAuthFacade({
    @required this.firebaseAuth,
    @required this.googleSignIn,
  });

  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  @override
  Future<Option<User>> getSignedInUser() async {
    final currentUser = await firebaseAuth.currentUser();
    return optionOf(currentUser?.toDomain());
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required PasswordValue passwordValue,
  }) async {
    final emailString = emailAddress.valueOrCrash;
    final passwordString = passwordValue.valueOrCrash;

    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: emailString,
        password: passwordString,
      );
      return right(unit);
    } on PlatformException catch (e) {
      switch (e.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          return left(const AuthFailure.emailAlreadyInUse());
        default:
          return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required PasswordValue passwordValue,
  }) async {
    final emailString = emailAddress.valueOrCrash;
    final passwordString = passwordValue.valueOrCrash;

    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: emailString,
        password: passwordString,
      );
      return right(unit);
    } on PlatformException catch (e) {
      switch (e.code) {
        case "ERROR_WRONG_PASSWORD":
          return left(const AuthFailure.invalidEmailAndPassword());
        case "ERROR_USER_NOT_FOUND":
          return left(const AuthFailure.invalidEmailAndPassword());
        default:
          return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuth = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return firebaseAuth
          .signInWithCredential(authCredential)
          .then((result) => right(unit));
    } on PlatformException {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signIn();
    await firebaseAuth.signOut();
  }
}
