import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/shared/spacing.dart';

class GameSubjectsComponent extends StatefulWidget {
  const GameSubjectsComponent({super.key});

  @override
  State<GameSubjectsComponent> createState() => _GameSubjectsComponentState();
}

class _GameSubjectsComponentState extends State<GameSubjectsComponent> {
  @override
  Widget build(BuildContext context) {
    final gameSubjects = [
      {
        'value': 'geografia',
        'label': 'Geografia',
        'imagePath': 'assets/icons/geography_subject.png',
      },
      {
        'value': 'historia',
        'label': 'História',
        'imagePath': 'assets/icons/history_subject.png',
      },
      {
        'value': 'portugues',
        'label': 'Portugues',
        'imagePath': 'assets/icons/geography_subject.png',
      },
      {
        'value': 'matematica',
        'label': 'Matemática',
        'imagePath': 'assets/icons/math_subject.png',
      },
      {
        'value': 'fisica',
        'label': 'Física',
        'imagePath': 'assets/icons/physical_subject.png',
      },
      {
        'value': 'quimica',
        'label': 'Química',
        'imagePath': 'assets/icons/chemical_subject.png',
      },
      {
        'value': 'filosofia',
        'label': 'Filosofia',
        'imagePath': 'assets/icons/philosophy_subject.png',
      },
      {
        'value': 'sociologia',
        'label': 'sociologia',
        'imagePath': 'assets/icons/geography_subject.png',
      },
      {
        'value': 'biologia',
        'label': 'Biologia',
        'imagePath': 'assets/icons/biology_subject.png',
      },
    ];

    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: Spacing.m,
            right: Spacing.m,
            top: Spacing.l,
          ),
          height: 125,
          decoration: const BoxDecoration(
            color: Color(0XFFDBCCF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(113, 109, 109, 109),
                offset: Offset(4, 4),
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                  width: 180,
                  child: Image.asset('assets/icons/all_subjects.png')),
              const SizedBox(
                width: Spacing.s,
              ),
              Text(
                'GERAL',
                style: GoogleFonts.lateef(
                  fontSize: 38,
                  letterSpacing: 3.98,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Spacing.m),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: gameSubjects.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 110,
              crossAxisCount: 2,
              crossAxisSpacing: Spacing.m,
              mainAxisSpacing: Spacing.m,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0XFFDBCCF2),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(113, 109, 109, 109),
                      offset: Offset(4, 4),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: Spacing.xxs,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        gameSubjects[index]['label']!,
                        style: GoogleFonts.lateef(
                          fontSize: 28,
                          letterSpacing: 3.98,
                          color: Colors.black,
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 60,
                          child: Image.asset(gameSubjects[index]['imagePath']!),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: Spacing.m),
      ],
    );
  }
}
