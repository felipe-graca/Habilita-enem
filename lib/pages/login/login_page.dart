import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/pages/login/login_cubit.dart';
import 'package:habilita_enem/shared/spacing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginCubit = GetIt.I.get<LoginCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<LoginCubit, LoginState>(
          bloc: loginCubit,
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              children: const [
                SizedBox(height: Spacing.xxxl),
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 250,
                  height: 250,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
