import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_ddd_course/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required this.authFacade,
  });

  final IAuthFacade authFacade;

  @override
  AuthState get initialState => const AuthState.initial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (event) async* {
        final userOption = await authFacade.getSignedInUser();
        yield userOption.fold(
          () => const AuthState.unauthenticated(),
          (a) => const AuthState.authenticated(),
        );
      },
      signedOut: (event) async* {
        await authFacade.signOut();
        yield const AuthState.unauthenticated();
      },
    );
  }
}
