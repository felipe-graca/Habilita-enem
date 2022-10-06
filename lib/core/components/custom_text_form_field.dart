import 'package:flutter/material.dart';
import 'package:habilita_enem/shared/inner_shadow.dart';
import 'package:habilita_enem/shared/spacing.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;

  const CustomTextFormField({
    this.label = '',
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.initialValue,
    super.key,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: InnerShadow(
        shadows: [
          BoxShadow(
            color: const Color(0xFFEAEAEA).withOpacity(0.12),
            offset: const Offset(-2, -2),
            blurRadius: 6,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            offset: const Offset(2, 2),
            blurRadius: 3,
          ),
        ],
        child: Container(
          height: 52.6,
          decoration: BoxDecoration(
            color: const Color(0xFFF8F7FC).withOpacity(0.47),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.m),
            child: Center(
              child: TextFormField(
                initialValue: widget.initialValue,
                controller: widget.controller,
                obscureText: widget.obscureText,
                decoration: InputDecoration(
                  hintText: widget.label,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
