import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_ddd_firebase/presentation/sign_in/sign_in_page.dart';
import 'package:flutter_ddd_firebase/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(
      page: SplashPage,
      initial: true,
    ),
    MaterialRoute(
      page: SignInPage,
    ),
  ],
)
class $Router {}
