import 'package:get_it/get_it.dart';
import 'package:habilita_enem/pages/login/login_cubit.dart';
import 'package:habilita_enem/pages/register/register_cubit.dart';
import 'package:habilita_enem/pages/reset_password/reset_password_cubit.dart';
import 'package:habilita_enem/pages/reset_password_code/reset_password_code_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static Future<void> setup() async {
    final i = GetIt.instance;

    i.registerSingleton(await SharedPreferences.getInstance());

    //pages
    i.registerSingleton(LoginCubit());
    i.registerSingleton(RegisterCubit());
    i.registerSingleton(ResetPasswordCubit());
    i.registerSingleton(ResetPasswordCodeCubit());
    // global cubits
  }
}
