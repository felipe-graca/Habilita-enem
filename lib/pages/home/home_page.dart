import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/shared/spacing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/home.png',
            scale: 1.3,
          ),
          const SizedBox(height: Spacing.l),
          SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: Spacing.xxl),
                Text(
                  'Bem vindo!',
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    letterSpacing: 5.4,
                    color: const Color(0xFF4D444F),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: Spacing.l),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
                  child: Text(
                    'Organize seus estudos e melhore o seu desempenho',
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      letterSpacing: 5.4,
                      color: const Color(0xFF4D444F),
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
