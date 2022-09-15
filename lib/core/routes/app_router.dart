import 'package:flutter/material.dart';
import 'package:habilita_enem/pages/login/login_page.dart';
import 'package:habilita_enem/pages/splash/splash.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppRouter {
  static const splash = '/splash';
  static const login = '/auth/login';

  static MaterialWithModalsPageRoute<dynamic> generateRoute(
      RouteSettings routeSettings) {
    // final args = routeSettings.arguments as Map<String, dynamic>?;

    late final Widget page;

    switch (routeSettings.name) {
      case '/':
      case splash:
        page = const SplashPage();
        break;
      case login:
        page = const LoginPage();
        break;
      default:
        page = Container();
    }
    return MaterialWithModalsPageRoute(
      builder: (_) => page,
      settings: routeSettings,
    );
  }
}
