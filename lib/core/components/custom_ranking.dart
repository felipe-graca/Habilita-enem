import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/core/models/user_model.dart';
import 'package:habilita_enem/pages/ranking/ranking_cubit.dart';
import 'package:habilita_enem/shared/componentes/linear_gradient.dart';
import 'package:habilita_enem/shared/spacing.dart';

class CustomRanking extends StatelessWidget {
  final UserModel first;
  final UserModel second;
  final UserModel third;
  const CustomRanking({
    super.key,
    required this.first,
    required this.second,
    required this.third,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFF17A6D7),
        Color(0xFF9D31FE),
      ],
    );
    return BlocBuilder<RankingCubit, RankingState>(
      bloc: GetIt.I.get<RankingCubit>(),
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Positioned(
                    right: (size.width / 2) + 35,
                    top: 90,
                    child: Column(
                      children: [
                        Text(
                          '2',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            shadows: [
                              Shadow(
                                color: Colors.greenAccent.shade400,
                                offset: const Offset(0, 0),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_drop_up,
                            color: Colors.blueAccent.shade700),
                        Stack(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: const BoxDecoration(
                                gradient: gradient,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 4,
                              child: Container(
                                width: 82,
                                height: 82,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                              'https://picsum.photos/200/300')
                                          .image),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Spacing.xs),
                        Text(
                          state.second.name,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.5,
                            shadows: [
                              Shadow(
                                color: Colors.greenAccent.shade400,
                                offset: const Offset(0, 0),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Spacing.xs),
                        Row(
                          children: [
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: LinearGradientMask(
                                child: Image.asset(
                                  'assets/icons/points_icon.png',
                                ),
                              ),
                            ),
                            const SizedBox(width: Spacing.xxs),
                            Text(
                              state.second.points.toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                letterSpacing: 1.48,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: (size.width / 2) + 35,
                    top: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '3',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            shadows: [
                              Shadow(
                                color: Colors.blueAccent.shade700,
                                offset: const Offset(0, 0),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                        Stack(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: const BoxDecoration(
                                gradient: gradient,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 4,
                              child: Container(
                                width: 82,
                                height: 82,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                              'https://picsum.photos/400/500')
                                          .image),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Spacing.xs),
                        Text(
                          state.third.name,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.5,
                            shadows: [
                              Shadow(
                                color: Colors.blueAccent.shade700,
                                offset: const Offset(0, 0),
                                blurRadius: 40,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Spacing.xs),
                        Row(
                          children: [
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: LinearGradientMask(
                                child: Image.asset(
                                  'assets/icons/points_icon.png',
                                ),
                              ),
                            ),
                            const SizedBox(width: Spacing.xxs),
                            Text(
                              state.third.points.toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                letterSpacing: 1.48,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: Spacing.s),
                          Text(
                            '1',
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.5,
                              shadows: [
                                Shadow(
                                  color: Colors.amber.shade600,
                                  offset: const Offset(0, 0),
                                  blurRadius: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              'assets/icons/crown_icon.png',
                              scale: 0.7,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 108,
                                  height: 108,
                                  decoration: const BoxDecoration(
                                    gradient: gradient,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Positioned(
                                  left: 4,
                                  top: 4,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                                  'https://picsum.photos/300/400')
                                              .image),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Spacing.xs),
                            Text(
                              state.first.name,
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 2.5,
                                shadows: [
                                  Shadow(
                                    color: Colors.amber.shade600,
                                    offset: const Offset(0, 0),
                                    blurRadius: 30,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: Spacing.xs),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: LinearGradientMask(
                                    child: Image.asset(
                                      'assets/icons/points_icon.png',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: Spacing.xxs),
                                Text(
                                  state.first.points.toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    letterSpacing: 1.48,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      const SizedBox(width: Spacing.l),
                      SizedBox(
                        width: 25,
                        height: 20,
                        child: Text(
                          (index + 1).toString(),
                          style: GoogleFonts.lato(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: Spacing.xs),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.users[index].name.toString()),
                            Padding(
                              padding: const EdgeInsets.only(right: Spacing.l),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                    height: 12,
                                    child: LinearGradientMask(
                                      child: Image.asset(
                                        'assets/icons/points_icon.png',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 25,
                                    height: 20,
                                    child: Text(
                                      state.users[index].points.toString(),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: Spacing.l,
                    right: Spacing.l,
                  ),
                  child: Divider(color: Colors.black.withOpacity(0.7)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
