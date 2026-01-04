import 'package:flutter/material.dart';
import 'package:todoapprev/core/page_route_name.dart';
import 'package:todoapprev/login/login_view.dart';
import 'package:todoapprev/registration/registration_view.dart';
import 'package:todoapprev/spalsh/splash_view.dart';
import 'package:todoapprev/tasks/layout_view.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PageRouteNames.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );

      case PageRouteNames.registration:
        return MaterialPageRoute(
          builder: (context) => const RegistrationView(),
          settings: settings,
        );
      case PageRouteNames.task:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }
  }
}
