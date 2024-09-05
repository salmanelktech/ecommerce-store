import 'package:flutter/material.dart';
import 'dart:math' as math;
class SemiCircle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2 - size.height * 0.05;
    final horizontalRadius = size.width / 1.5;
    final verticalRadius = size.height / 2;

    final paintBorder = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawArc(
        Rect.fromCenter(
          center: Offset(centerX, centerY),
          width: horizontalRadius,
          height: verticalRadius,
        ),
        math.pi / 4,
        math.pi / 2,
        true,
        paintBorder);

    final paintBottom = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.arcTo(Rect.fromCircle(center: Offset(centerX, centerY), radius: horizontalRadius), 0, math.pi, false);
    path.close();
    canvas.drawPath(path, paintBottom);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
