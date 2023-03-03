import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/components/base_page/base_cubit.dart';
import 'package:habilita_enem/core/repository/auth/auth_repository.dart';
import 'package:habilita_enem/core/repository/auth/auth_repository_interface.dart';
import 'package:habilita_enem/core/repository/news/news_repository.dart';
import 'package:habilita_enem/core/repository/news/news_repository_interface.dart';
import 'package:habilita_enem/core/repository/questions/questions_repository.dart';
import 'package:habilita_enem/core/repository/questions/questions_repository_interface.dart';
import 'package:habilita_enem/core/repository/user/user_repository.dart';
import 'package:habilita_enem/core/repository/user/user_repository_interface.dart';
import 'package:habilita_enem/core/service/http_service/http_service_interface.dart';
import 'package:habilita_enem/core/service/http_service/http_servie.dart';
import 'package:habilita_enem/core/service/storage/storage_service.dart';
import 'package:habilita_enem/core/service/storage/storage_service_interface.dart';
import 'package:habilita_enem/pages/game/game_cubit.dart';
import 'package:habilita_enem/pages/history/history_cubit.dart';
import 'package:habilita_enem/pages/home/home_cubit.dart';
import 'package:habilita_enem/pages/login/login_cubit.dart';
import 'package:habilita_enem/pages/profile/profile_cubit.dart';
import 'package:habilita_enem/pages/ranking/ranking_cubit.dart';
import 'package:habilita_enem/pages/register/register_cubit.dart';
import 'package:habilita_enem/pages/reset_password/reset_password_cubit.dart';
import 'package:habilita_enem/pages/settings/settings_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/reset_password_code/reset_password_code_cubit.dart';

class ServiceLocator {
  static Future<void> setup() async {
    final i = GetIt.instance;

    i.registerSingleton(await SharedPreferences.getInstance());

    // global cubits
    i.registerLazySingleton(() => FirebaseFirestore.instance);

    i.registerLazySingleton<IHttpService>(() => HttpService());
    i.registerLazySingleton<IQuestionsRepository>(
        () => QuestionsRepository(i.get()));
    i.registerLazySingleton<IStorageService>(() => StorageService(i.get()));

    i.registerLazySingleton(() => AuthCubit(i.get()));

    i.registerLazySingleton<IUserRepository>(() => UserRepository(i.get()));
    i.registerLazySingleton<IAuthRepository>(() => AuthRepository());
    i.registerLazySingleton<INewsRepository>(() => NewsRepository(i.get()));
    // page cubits
    i.registerLazySingleton(() => BaseCubit(i.get()));
    i.registerLazySingleton(() => LoginCubit(i.get(), i.get()));
    i.registerLazySingleton(() => RegisterCubit(i.get(), i.get()));
    i.registerLazySingleton(() => ResetPasswordCubit());
    i.registerLazySingleton(() => ResetPasswordCodeCubit());
    i.registerLazySingleton(() => GameCubit(i.get()));
    i.registerLazySingleton(() => HistoryCubit(i.get()));
    i.registerLazySingleton(() => SettingsCubit());
    i.registerLazySingleton(() => ProfileCubit(i.get()));
    i.registerLazySingleton(() => RankingCubit(i.get()));
    i.registerLazySingleton(() => HomeCubit(i.get()));
  }
}
