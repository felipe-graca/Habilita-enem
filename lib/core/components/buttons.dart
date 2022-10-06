import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  const PrimaryButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.55,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.53),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF424c73).withOpacity(0.5),
              offset: const Offset(4, 4),
              blurRadius: 4,
            )
          ]),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.lato(
            shadows: const [
              Shadow(
                color: Colors.white,
                offset: Offset(0, 0),
                blurRadius: 20,
              )
            ],
            fontWeight: FontWeight.w400,
            height: 0.765,
            fontSize: 16,
            color: Colors.white,
            letterSpacing: 4.48,
          ),
        ),
      ),
    );
  }
}

class SecundaryButton extends StatelessWidget {
  const SecundaryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
