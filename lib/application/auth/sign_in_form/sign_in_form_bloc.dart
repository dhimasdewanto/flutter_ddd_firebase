import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ddd_firebase/domain/auth/auth_failure.dart';
import 'package:flutter_ddd_firebase/domain/auth/i_auth_facade.dart';
import 'package:flutter_ddd_firebase/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc({
    @required this.authFacade,
  });

  final IAuthFacade authFacade;

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailString),
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          passwordValue: PasswordValue(e.passwordString),
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          authFacade.registerWithEmailAndPassword,
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          authFacade.signInWithEmailAndPassword,
        );
      },
      signInWithGoogle: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        final failOrSuccess = await authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failOrSuccess),
        );
      },
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress emailAddress,
      @required PasswordValue passwordValue,
    })
        fowardedCall,
  ) async* {
    Either<AuthFailure, Unit> failOrSuccess;

    final isEmailValid = state.emailAddress.isValid;
    final isPasswordValid = state.passwordValue.isValid;

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failOrSuccess = await fowardedCall(
        emailAddress: state.emailAddress,
        passwordValue: state.passwordValue,
      );
    }

    yield state.copyWith(
      showErrorMessages: true,
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(failOrSuccess),
    );
  }
}
