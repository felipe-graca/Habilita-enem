import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/bloc/service_locator.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
import 'package:habilita_enem/firebase/firebase_options.dart';

Future<void> initializeServices() async {
  //initialize service injection
  await ServiceLocator.setup();

  //initialize getIt
  await GetIt.I.allReady();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    FutureBuilder(
      future: initializeServices(),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Container(),
          );
        }
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final _authCubit = GetIt.I.get<AuthCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _authCubit.startListenAuthChanges();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Habilita Enem',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
