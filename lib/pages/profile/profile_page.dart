import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/components/custom_buttons.dart';
import 'package:habilita_enem/core/components/custom_snackbar.dart';
import 'package:habilita_enem/core/components/custom_text_form_field.dart';
import 'package:habilita_enem/pages/profile/profile_cubit.dart';
import 'package:habilita_enem/shared/spacing.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileCubit = GetIt.I.get<ProfileCubit>();

  @override
  void initState() {
    profileCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: profileCubit,
        builder: (context, state) {
          return Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: Spacing.m),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: Spacing.m),
                          Icon(Icons.arrow_back_ios_new,
                              size: 30, color: Colors.black.withOpacity(0.8)),
                          const SizedBox(width: Spacing.s),
                          Text(
                            'Voltar',
                            style: GoogleFonts.lato(
                              fontSize: 19,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Spacing.xxl,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              left: 1,
                              top: 1,
                              child: SizedBox(
                                width: 98,
                                height: 98,
                                child: Image.asset(
                                  'assets/icons/profile_icon.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  shape: BoxShape.circle),
                            ),
                            Positioned(
                              left: 35,
                              top: 35,
                              child: Icon(
                                Icons.image,
                                color: Colors.white.withOpacity(0.9),
                                size: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: Spacing.xxl),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Spacing.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("E-mail"),
                          const SizedBox(height: Spacing.s),
                          CustomTextFormField(
                            isDisabled: true,
                            initialValue: state.email.value,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {},
                            errorMessage: 'E-mail inválido',
                            hasError: false,
                            wasSubmitted: false,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacing.l),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Spacing.l),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Primeiro nome"),
                          const SizedBox(height: Spacing.s),
                          CustomTextFormField(
                            initialValue: state.name.value,
                            onChanged: (value) {
                              profileCubit.nameChanged(value);
                            },
                            errorMessage: 'nome inválido',
                            hasError: state.name.invalid,
                            wasSubmitted: state.wasSubmitted,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacing.xxxxl + Spacing.xxl),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Spacing.l),
                      child: CustomPrimaryButton(
                        fullWidth: true,
                        label: 'Salvar',
                        isLoading: profileCubit.isLoading,
                        onTap: () async {
                          if (state.name.value.trim() ==
                              GetIt.I<AuthCubit>().currentUser.name) return;
                          if (profileCubit.validateForm()) {
                            if (await profileCubit.submit()) {
                              CustomSnackBar.show(
                                text: 'Informações alteradas com sucesso',
                                status: CustomSnackbarStatus.success,
                                context: context,
                              );
                              return;
                            }
                            CustomSnackBar.show(
                              text: 'Informações não foram salvas',
                              status: CustomSnackbarStatus.error,
                              context: context,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: Spacing.s),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
