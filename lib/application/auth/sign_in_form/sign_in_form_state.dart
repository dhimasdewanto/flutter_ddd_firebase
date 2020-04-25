part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required EmailAddress emailAddress,
    @required PasswordValue passwordValue,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    /// Option = Has result or not (not error)
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
    emailAddress: EmailAddress(""),
    passwordValue: PasswordValue(""),
    showErrorMessages: false,
    isSubmitting: false,
    authFailureOrSuccessOption: none(),
  );
}
