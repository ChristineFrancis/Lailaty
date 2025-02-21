import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final bool isTapped;

  CircularProgressPainter(this.progress, this.isTapped);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 12;
    Paint backgroundPaint = Paint()
      ..color = ColorManager.grey1
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Paint progressPaint = Paint()
      ..color = ColorManager.grey2
      ..style = PaintingStyle.stroke
      ..strokeWidth = isTapped ? strokeWidth + 5 : strokeWidth;
    // ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width - strokeWidth) / 2;
    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * progress;

    canvas.drawCircle(center, radius, backgroundPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isTapped != isTapped;
  }
}
