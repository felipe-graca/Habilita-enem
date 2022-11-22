import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/shared/inner_shadow.dart';
import 'package:habilita_enem/shared/spacing.dart';
import 'package:habilita_enem/shared/touch_wrapper.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final bool fullWidth;
  final bool isLoading;

  const CustomPrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.leftIcon,
    this.rightIcon,
    this.fullWidth = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchWrapper(
      onTap: () {
        if (onTap != null && !isLoading) {
          onTap!();
        }
      },
      builder: (value) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: TouchWrapper.interpolateOuterShadow([
              BoxShadow(
                color: const Color(0xFF424C73).withOpacity(0.65),
                offset: const Offset(4, 4),
                blurRadius: 4,
              )
            ], value),
            borderRadius: BorderRadius.circular(9),
          ),
          child: InnerShadow(
            shadows: TouchWrapper.interpolateInnerShadow([
              BoxShadow(
                color: Colors.black.withOpacity(0.65),
                blurRadius: 6,
                spreadRadius: 0,
                offset: const Offset(2.5, 2.5),
              ),
            ], value),
            child: Container(
              width: fullWidth ? null : 150,
              height: 54.55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.black.withOpacity(0.65),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leftIcon != null && !isLoading)
                    Padding(
                      padding: const EdgeInsets.only(right: Spacing.xxs),
                      child: Icon(leftIcon, size: 20),
                    ),
                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.only(right: Spacing.xxs),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else
                    Text(
                      label,
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 4.48,
                        height: 0.765,
                        shadows: [
                          const BoxShadow(
                            color: Colors.white,
                            blurRadius: 40,
                            spreadRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  if (rightIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: Spacing.xxs),
                      child: Icon(rightIcon, size: 20),
                    ),
                ],
              ),
            ),
          ),
        );
      },
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
