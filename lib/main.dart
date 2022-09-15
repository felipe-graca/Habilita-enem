import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habilita_enem/firebase_options.dart';
import 'package:habilita_enem/pages/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Habilita Enem',
      home: SplashPage(),
    );
  }
}
