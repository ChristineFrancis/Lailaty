import 'package:flutter/material.dart';

class ShadowPainter extends CustomPainter {
  final Color color;
  final BuildContext context;

  ShadowPainter({
    required this.color,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    double width = MediaQuery.of(context).size.width / 6.5;
    double height = MediaQuery.of(context).size.height / 15;
    double verticalStretch = 0.3;

    path.moveTo(width, 0); // Top center
    path.lineTo(width, 0); // Top right
    path.lineTo(width, height * (0.6 + verticalStretch)); // Bottom right
    path.lineTo(width * 0.5, height * (0.9 + verticalStretch)); // Bottom center
    path.lineTo(0, height * (0.6 + verticalStretch)); // Bottom left
    path.lineTo(0, 0); // Top left
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
