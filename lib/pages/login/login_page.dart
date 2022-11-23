import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/helpers/app_ui.dart';
import 'package:habilita_enem/core/components/custom_buttons.dart';
import 'package:habilita_enem/core/components/custom_snackbar.dart';
import 'package:habilita_enem/core/components/custom_text_form_field.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
import 'package:habilita_enem/pages/login/login_cubit.dart';
import 'package:habilita_enem/shared/componentes/custom_keyboard_actions.dart';
import 'package:habilita_enem/shared/spacing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginCubit = GetIt.I.get<LoginCubit>();
  final authCubit = GetIt.I<AuthCubit>();

  late final StreamSubscription authSubscription;

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      AppUI.checkSnackbarToDisplay(context: context, page: AppRouter.login);
    });

    authSubscription = authCubit.isLogged.listen((event) async {
      if (event) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            AppRouter.base, (Route<dynamic> route) => false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    emailNode.dispose();
    passwordNode.dispose();
    authSubscription.cancel();
    super.dispose();
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
            return CustomKeyboardActions(
              nodes: [
                emailNode,
                passwordNode,
              ],
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: Spacing.xxxl),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: Spacing.xxxl),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: CustomTextFormField(
                      label: 'Digite seu e-mail',
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        loginCubit.emailChanged(value);
                      },
                      errorMessage: 'E-mail inválido',
                      hasError: state.email.invalid,
                      wasSubmitted: state.wasSubmitted,
                    ),
                  ),
                  const SizedBox(height: Spacing.m),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: CustomTextFormField(
                      label: 'Digite sua senha',
                      obscureText: true,
                      onChanged: (value) {
                        loginCubit.passwordChanged(value);
                      },
                      focusNode: passwordNode,
                      hasError: state.password.invalid,
                      errorMessage: 'Senha inválida',
                      wasSubmitted: state.wasSubmitted,
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
                  const SizedBox(height: Spacing.xxl),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: CustomPrimaryButton(
                      label: 'Entrar',
                      onTap: () async {
                        if (!loginCubit.validateForm()) return;
                        await loginCubit.submit();

                        if (loginCubit.submissionSuccess) {
                          AppUI.snackbarsToDisplayWhenStart.add(
                            SnackbarToDisplayModel(
                              text: 'Login efetuado com sucesso',
                              status: CustomSnackbarStatus.success,
                              page: AppRouter.base,
                            ),
                          );
                        } else {
                          CustomSnackBar.show(
                            text: 'Erro ao fazer login',
                            status: CustomSnackbarStatus.error,
                            context: context,
                          );
                        }
                      },
                      fullWidth: true,
                      isLoading: loginCubit.isLoading,
                    ),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
