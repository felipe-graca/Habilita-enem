import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/core/bloc/auth/auth_cubit.dart';
import 'package:habilita_enem/core/routes/app_router.dart';
import 'package:habilita_enem/pages/history/history_cubit.dart';
import 'package:habilita_enem/shared/componentes/linear_gradient.dart';
import 'package:habilita_enem/shared/spacing.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final historyCubit = GetIt.I.get<HistoryCubit>();

  @override
  void initState() {
    historyCubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
                const SizedBox(height: Spacing.xs),
                SizedBox(
                  height: 220,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/habilita_min.png',
                            height: 200,
                            width: 200,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/enem_text.png',
                          scale: 1.1,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 100),
                          height: height - 220,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Container(
                            height: height - 320,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9C1F0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: ListView(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                const SizedBox(
                                  height: Spacing.xxxl,
                                ),
                                Container(
                                  height: 45,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 171, 149, 204),
                                  ),
                                  child: BlocBuilder<AuthCubit, AuthState>(
                                    bloc: GetIt.I<AuthCubit>(),
                                    builder: (context, state) {
                                      return Center(
                                        child: Text(
                                          'Olá, ${state.userModel.name}, como vai?',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                            fontSize: 20,
                                            letterSpacing: 4,
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            shadows: [
                                              BoxShadow(
                                                offset: const Offset(0, 4),
                                                blurRadius: 4,
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: Spacing.xl),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (width / 2) + 20,
                                        height: 57,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 171, 149, 204),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            bottomRight: Radius.circular(25),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(1, 7),
                                              blurRadius: 9,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: Spacing.xs),
                                            Icon(Icons.arrow_back_ios_new,
                                                size: 35,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                            const SizedBox(width: Spacing.s),
                                            Text(
                                              'Voltar',
                                              style: GoogleFonts.lato(
                                                fontSize: 19,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: Spacing.l),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRouter.profile);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (width / 2) + 20,
                                        height: 57,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 171, 149, 204),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            bottomRight: Radius.circular(25),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(1, 7),
                                              blurRadius: 9,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: Spacing.xs),
                                            Icon(Icons.settings,
                                                size: 35,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                            const SizedBox(width: Spacing.s),
                                            Text(
                                              'Meus Dados',
                                              style: GoogleFonts.lato(
                                                fontSize: 19,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: Spacing.l),
                                InkWell(
                                  onTap: () async {
                                    await GetIt.I<AuthCubit>().logout();
                                    navigator.pushNamedAndRemoveUntil(
                                      AppRouter.login,
                                      ModalRoute.withName(AppRouter.login),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (width / 2) + 20,
                                        height: 57,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 171, 149, 204),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(25),
                                            bottomRight: Radius.circular(25),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(1, 7),
                                              blurRadius: 9,
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: Spacing.xs),
                                            Icon(Icons.logout_outlined,
                                                size: 35,
                                                color: Colors.black
                                                    .withOpacity(0.8)),
                                            const SizedBox(width: Spacing.s),
                                            Text(
                                              'Sair',
                                              style: GoogleFonts.lato(
                                                fontSize: 19,
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: LinearGradientMask(
                                child: Image.asset(
                                  'assets/icons/profile_icon.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
