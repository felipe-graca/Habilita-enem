import 'package:flutter/material.dart';
import 'package:habilita_enem/pages/login/login_page.dart';
import 'package:habilita_enem/pages/register/register_page.dart';
import 'package:habilita_enem/pages/reset_password/reset_password_page.dart';
import 'package:habilita_enem/pages/reset_password_code/reset_password_code_page.dart';
import 'package:habilita_enem/pages/splash/splash.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppRouter {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const resetPassword = '/resetPassword';
  static const resetPasswordCode = '/resetPasswordCode';

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
      case register:
        page = const RegisterPage();
        break;
      case resetPassword:
        page = const ResetPasswordPage();
        break;
      case resetPasswordCode:
        page = const ResetPasswordCodePage();
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
