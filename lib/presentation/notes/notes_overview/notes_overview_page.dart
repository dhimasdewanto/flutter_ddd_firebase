import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/notes/note_actor/note_actor_bloc.dart';
import '../../../application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                unauthenticated: (_) {
                  ExtendedNavigator.of(context)
                      .pushReplacementNamed(Routes.signInPage);
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deletedFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 5),
                    message: state.failure.map(
                      unexpected: (_) =>
                          "Unexpected error occured while deleting.",
                      insufficientPermission: (_) => "Insufficient permission.",
                      unableToUpdate: (_) => "Unable to update.",
                      unableToDelete: (_) => "Unable to delete.",
                    ),
                  ).show(context);
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Notes"),
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.indeterminate_check_box),
                onPressed: () {},
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
