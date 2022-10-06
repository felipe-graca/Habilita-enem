import 'package:flutter/material.dart';
import 'package:habilita_enem/core/routes/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRouter.login,
          (route) => false,
        )
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              'assets/images/logo_splash.png',
            ),
          ),
        ),
      ),
    );
  }
}
