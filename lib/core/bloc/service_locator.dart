import 'package:get_it/get_it.dart';
import 'package:habilita_enem/pages/login/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static Future<void> setup() async {
    final i = GetIt.instance;

    i.registerSingleton(await SharedPreferences.getInstance());
    i.registerSingleton(LoginCubit());

    // global cubits
  }
}
