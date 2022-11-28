import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habilita_enem/shared/componentes/custom_border_painter.dart';
import 'package:habilita_enem/shared/componentes/size_provider_widget.dart';
import 'package:habilita_enem/shared/inner_shadow.dart';
import 'package:habilita_enem/shared/spacing.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final String hint;
  final TextInputType keyboardType;
  final dynamic suffixIcon;
  final bool autovalidate;
  final bool isDisabled;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final bool obscureText;
  final int maxLines;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTapIcon;
  final bool hasError;
  final String? errorMessage;
  final bool wasSubmitted;
  final double radius;
  final bool addEmptySpace;
  final String? initialValue;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hint = '',
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.autovalidate = false,
    this.isDisabled = false,
    this.controller,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.onEditingComplete,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
    this.onTapIcon,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.hasError = false,
    this.errorMessage,
    this.wasSubmitted = false,
    this.radius = 10,
    this.addEmptySpace = false,
    this.initialValue,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool looseFocus = false;
  late final FocusNode _focusNode;
  late Size widgetSize;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && !looseFocus) {
        if (mounted) {
          setState(
            () {
              looseFocus = true;
            },
          );
        }
      } else {
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.hasError && (looseFocus || widget.wasSubmitted);
    return Stack(
      children: [
        ClipRRect(
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
                  child: OrientationBuilder(builder: (context, orientation) {
                    return SizeProviderWidget(
                      onChildSize: (size) {
                        widgetSize = size;
                      },
                      child: TextFormField(
                        enabled: !widget.isDisabled,
                        onChanged: widget.onChanged,
                        initialValue: widget.initialValue,
                        controller: widget.controller,
                        obscureText: widget.obscureText,
                        decoration: InputDecoration(
                          hintText: widget.label,
                          border: InputBorder.none,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
        if (hasError) ...[
          SizedBox(
            height: widgetSize.height + 6,
            width: double.maxFinite,
            child: IgnorePointer(
              child: CustomPaint(
                  painter: CustomBorderPainter(color: const Color(0xFFF3BEBE))),
            ),
          ),
          if (widget.errorMessage != null)
            Container(
              height: widgetSize.height + 25,
              padding: const EdgeInsets.only(left: Spacing.xxs),
              alignment: Alignment.bottomLeft,
              child: Text(widget.errorMessage!,
                  style: GoogleFonts.lato(color: const Color(0xFFF3BEBE))),
            ),
        ],
      ],
    );
  }
}
