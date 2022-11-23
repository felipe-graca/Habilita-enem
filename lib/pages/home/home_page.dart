import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/helpers/app_ui.dart';
import 'package:habilita_enem/core/routes/app_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final StreamSubscription authSubscription;

  final authCubit = GetIt.I.get<AuthCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppUI.checkSnackbarToDisplay(context: context, page: AppRouter.base);

      authSubscription = authCubit.isLogged.listen((event) async {
        if (!event) {
          Navigator.of(context).pushReplacementNamed(
            AppRouter.login,
          );
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
