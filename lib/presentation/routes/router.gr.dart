// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ddd_firebase/presentation/splash/splash_page.dart';
import 'package:flutter_ddd_firebase/presentation/sign_in/sign_in_page.dart';

class Routes {
  static const String splashPage = '/';
  static const String signInPage = '/sign-in-page';
  static const all = <String>{
    splashPage,
    signInPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.signInPage, page: SignInPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (RouteData data) {
      var args = data.getArgs<SplashPageArguments>(
          orElse: () => SplashPageArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(key: args.key),
        settings: data,
      );
    },
    SignInPage: (RouteData data) {
      var args = data.getArgs<SignInPageArguments>(
          orElse: () => SignInPageArguments());
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(key: args.key),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future<dynamic> pushSplashPage({
    Key key,
  }) =>
      pushNamed<dynamic>(
        Routes.splashPage,
        arguments: SplashPageArguments(key: key),
      );

  Future<dynamic> pushSignInPage({
    Key key,
  }) =>
      pushNamed<dynamic>(
        Routes.signInPage,
        arguments: SignInPageArguments(key: key),
      );
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
