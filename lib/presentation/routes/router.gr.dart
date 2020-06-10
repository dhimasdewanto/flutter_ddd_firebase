// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ddd_firebase/presentation/splash/splash_page.dart';
import 'package:flutter_ddd_firebase/presentation/sign_in/sign_in_page.dart';

abstract class Routes {
  static const splashPage = '/';
  static const signInPage = '/sign-in-page';
  static const all = {
    splashPage,
    signInPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashPage:
        if (hasInvalidArgs<SplashPageArguments>(args)) {
          return misTypedArgsRoute<SplashPageArguments>(args);
        }
        final typedArgs = args as SplashPageArguments ?? SplashPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.signInPage:
        if (hasInvalidArgs<SignInPageArguments>(args)) {
          return misTypedArgsRoute<SignInPageArguments>(args);
        }
        final typedArgs = args as SignInPageArguments ?? SignInPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignInPage(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//SplashPage arguments holder class
class SplashPageArguments {
  final Key key;
  SplashPageArguments({this.key});
}

//SignInPage arguments holder class
class SignInPageArguments {
  final Key key;
  SignInPageArguments({this.key});
}
