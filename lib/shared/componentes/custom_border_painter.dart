import 'package:flutter/material.dart';

class CustomBorderPainter extends CustomPainter {
  final double width;
  final double radius;
  final Color color;

  CustomBorderPainter({
    this.width = 1.0,
    this.radius = 10.0,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final padding = width / 2;

    final rect = Rect.fromLTWH(
      0 + padding,
      0 + padding,
      size.width - padding * 2,
      size.height - padding * 2,
    );

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(radius)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
