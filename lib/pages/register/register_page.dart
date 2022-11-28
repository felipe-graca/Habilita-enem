import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/components/custom_buttons.dart';
import 'package:habilita_enem/core/components/custom_snackbar.dart';
import 'package:habilita_enem/core/components/custom_text_form_field.dart';
import 'package:habilita_enem/core/helpers/app_ui.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
import 'package:habilita_enem/pages/register/register_cubit.dart';
import 'package:habilita_enem/shared/componentes/custom_keyboard_actions.dart';
import 'package:habilita_enem/shared/spacing.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerCubit = GetIt.I.get<RegisterCubit>();

  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  @override
  void initState() {
    registerCubit.init();
    super.initState();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    nameFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          bloc: registerCubit,
          builder: (context, state) {
            return CustomKeyboardActions(
              nodes: [
                emailFocus,
                nameFocus,
                passwordFocus,
                confirmPasswordFocus,
              ],
              child: ListView(
                shrinkWrap: true,
                children: [
                  const SizedBox(height: Spacing.m),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.m),
                  const Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: Spacing.m),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: CustomTextFormField(
                      onChanged: (value) {
                        registerCubit.emailChanged(value);
                      },
                      label: 'E-mail',
                      hasError: !state.email.valid,
                      errorMessage: 'E-mail inválido',
                      focusNode: emailFocus,
                      wasSubmitted: state.wasSubmitted,
                    ),
                  ),
                  const SizedBox(height: Spacing.m),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: CustomTextFormField(
                      label: 'Primeiro nome',
                      onChanged: (value) {
                        registerCubit.nameChanged(value);
                      },
                      hasError: state.password.invalid,
                      errorMessage: state.errorMessage.isNotEmpty
                          ? state.errorMessage
                          : 'nome inválido',
                      focusNode: nameFocus,
                      wasSubmitted: state.wasSubmitted,
                    ),
                  ),
                  const SizedBox(height: Spacing.m),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: CustomTextFormField(
                      label: 'senha',
                      obscureText: true,
                      onChanged: (value) {
                        registerCubit.passwordChanged(value);
                      },
                      hasError: state.password.invalid,
                      errorMessage: 'Senha inválida',
                      focusNode: passwordFocus,
                      wasSubmitted: state.wasSubmitted,
                    ),
                  ),
                  const SizedBox(height: Spacing.m),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                    child: CustomTextFormField(
                      onChanged: (value) {
                        registerCubit.confirmedPasswordChanged(value);
                      },
                      label: 'Confirmar senha',
                      obscureText: true,
                      hasError: !state.confirmedPassword.valid,
                      errorMessage: 'Senhas não conferem',
                      focusNode: confirmPasswordFocus,
                      wasSubmitted: state.wasSubmitted,
                    ),
                  ),
                  const SizedBox(height: Spacing.l),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Spacing.l, right: Spacing.l, bottom: Spacing.l),
                    child: CustomPrimaryButton(
                      label: 'Cadastrar',
                      fullWidth: true,
                      isLoading: registerCubit.isLoading,
                      onTap: () async {
                        if (!registerCubit.validateForm()) return;
                        await registerCubit.submit();

                        if (registerCubit.submissionSuccess) {
                          AppUI.snackbarsToDisplayWhenStart
                              .add(SnackbarToDisplayModel(
                            text: 'Cadastrar efetuado com sucesso',
                            status: CustomSnackbarStatus.success,
                            page: AppRouter.base,
                          ));

                          if (!mounted) return;
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRouter.base, (Route<dynamic> route) => false);
                        } else {
                          CustomSnackBar.show(
                            text: 'Erro ao efetuar o Cadastrar',
                            status: CustomSnackbarStatus.error,
                            context: context,
                          );
                        }
                      },
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
