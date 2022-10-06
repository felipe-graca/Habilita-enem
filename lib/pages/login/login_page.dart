import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/core/components/buttons.dart';
import 'package:habilita_enem/core/components/custom_text_form_field.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
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
              children: [
                const SizedBox(height: Spacing.xxxl),
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: Spacing.xxxl),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: CustomTextFormField(label: 'Digite seu e-mail'),
                ),
                const SizedBox(height: Spacing.m),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: CustomTextFormField(
                    label: 'Digite sua senha',
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: Spacing.l,
                    top: Spacing.xxs,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AppRouter.resetPassword),
                        child: Text(
                          "Esqueceu sua senha?",
                          style: GoogleFonts.lato(
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.xxxl),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: PrimaryButton(text: 'Entrar'),
                ),
                const SizedBox(height: Spacing.s),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não tem uma conta?',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          letterSpacing: 1.54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: Spacing.xs),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRouter.register);
                        },
                        child: Text(
                          'Cadastre-se',
                          style: GoogleFonts.lato(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            color: Colors.black,
                            letterSpacing: 1.54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
