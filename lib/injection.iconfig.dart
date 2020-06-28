// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_ddd_firebase/infrastructure/core/firebase_injectable_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_ddd_firebase/infrastructure/auth/firebase_auth_facade.dart';
import 'package:flutter_ddd_firebase/domain/auth/i_auth_facade.dart';
import 'package:flutter_ddd_firebase/infrastructure/notes/note_repository.dart';
import 'package:flutter_ddd_firebase/domain/notes/i_note_repository.dart';
import 'package:flutter_ddd_firebase/application/notes/note_form/note_form_bloc.dart';
import 'package:flutter_ddd_firebase/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:flutter_ddd_firebase/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:flutter_ddd_firebase/application/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<Firestore>(() => firebaseInjectableModule.firestore);
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerLazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
      firebaseAuth: g<FirebaseAuth>(), googleSignIn: g<GoogleSignIn>()));
  g.registerLazySingleton<INoteRepository>(
      () => NoteRepository(firestore: g<Firestore>()));
  g.registerFactory<NoteFormBloc>(
      () => NoteFormBloc(noteRepository: g<INoteRepository>()));
  g.registerFactory<NoteWatcherBloc>(
      () => NoteWatcherBloc(noteRepository: g<INoteRepository>()));
  g.registerFactory<SignInFormBloc>(
      () => SignInFormBloc(authFacade: g<IAuthFacade>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(authFacade: g<IAuthFacade>()));
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
