import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_firebase/application/auth/auth_bloc.dart';

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../routes/router.gr.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => "Cancelled",
                  serverError: (_) => "Server error",
                  emailAlreadyInUse: (_) => "Email already in use",
                  invalidEmailAndPassword: (_) => "Invalid email or password",
                ),
              ).show(context);
            },
            (success) {
              ExtendedNavigator.of(context).pushReplacementNamed(
                Routes.notesOverviewPage,
              );
              context.bloc<AuthBloc>().add(
                    const AuthEvent.authCheckRequested(),
                  );
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 8.0),
                Text(
                  "Auth",
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: "Email",
                  ),
                  onChanged: (value) => context
                      .bloc<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value)),

                  /// Use context.bloc<SignInFormBloc>().state.emailAddress
                  /// Instead of state.emailAddress
                  /// Because if we typed 'ABC', validator only work 'AB'
                  /// So state only can read before it build.
                  validator: (_) => context
                      .bloc<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (failure) => failure.maybeMap(
                          invalidEmail: (_) => "Invalid Email",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                  ),
                  onChanged: (value) => context
                      .bloc<SignInFormBloc>()
                      .add(SignInFormEvent.passwordChanged(value)),

                  /// Use context.bloc<SignInFormBloc>().state.passwordValue
                  /// Instead of state.passwordValue
                  /// Because if we typed 'ABC', validator only work 'AB'
                  /// So state only can read before it build.
                  validator: (_) => context
                      .bloc<SignInFormBloc>()
                      .state
                      .passwordValue
                      .value
                      .fold(
                        (failure) => failure.maybeMap(
                          invalidEmail: (_) => "Short Password",
                          orElse: () => null,
                        ),
                        (_) => null,
                      ),
                ),
                const SizedBox(height: 8.0),
                FlatButton(
                  onPressed: () => context.bloc<SignInFormBloc>().add(
                      const SignInFormEvent
                          .signInWithEmailAndPasswordPressed()),
                  child: const Text("SIGN IN"),
                ),
                const SizedBox(height: 8.0),
                FlatButton(
                  onPressed: () => context.bloc<SignInFormBloc>().add(
                      const SignInFormEvent
                          .registerWithEmailAndPasswordPressed()),
                  child: const Text("REGISTER"),
                ),
                const SizedBox(height: 8.0),
                FlatButton(
                  onPressed: () => context
                      .bloc<SignInFormBloc>()
                      .add(const SignInFormEvent.signInWithGoogle()),
                  child: const Text("SIGN IN WITH GOOGLE"),
                ),
                if (state.isSubmitting) _loadingIndicator(),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 8.0),
        Container(
          width: 40.0,
          height: 40.0,
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
