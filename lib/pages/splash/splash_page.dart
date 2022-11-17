import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
import 'dart:math' as math;

class SplashPage extends StatefulWidget {
  final bool canNavigate;
  const SplashPage({Key? key, required this.canNavigate}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  StreamSubscription<bool>? authSubscription;
  final _authCubit = GetIt.I.get<AuthCubit>();

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    authSubscription = _authCubit.isLogged.listen((isLogged) {
      handleNavigation(isLogged, _authCubit);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    authSubscription?.cancel();
    super.dispose();
  }

  void handleNavigation(bool isLogged, AuthCubit authCubit) {
    Future.delayed(const Duration(seconds: 1)).then((_) async {
      if (!mounted) {
        return;
      }
      if (isLogged) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.home, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushReplacementNamed(AppRouter.login);
      }
    });
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
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Transform.rotate(
              angle: _controller.value * 2 * -math.pi,
              child: child,
            ),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                'assets/images/logo_splash.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
