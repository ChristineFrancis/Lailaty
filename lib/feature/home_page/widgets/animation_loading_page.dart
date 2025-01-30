import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class LoadingAnimationPainter extends CustomPainter {
  final double rotationAngle; // Angle of rotation in radians
  final bool showTriangle;
  final bool showSmallCircle1;
  final bool showSmallCircle2;
  final bool showSmallCircle3;
  LoadingAnimationPainter(this.rotationAngle, this.showTriangle,
      this.showSmallCircle1, this.showSmallCircle2, this.showSmallCircle3);

  @override
  void paint(Canvas canvas, Size size) {
    final paintOfVector = Paint()
      ..color = ColorManager.yellowAccent.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    final paintOfInnerTriangle = Paint()
      ..color = ColorManager.yellowAccent.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    final paintOfCircle = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;
    final paintOfSmallCircle = Paint()
      ..color = ColorManager.yellowAccent
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 1.5, paintOfCircle);
    canvas.drawCircle(center, 1, paintOfCircle);
    canvas.drawCircle(center, size.width / 2.3, paintOfCircle);
    canvas.drawCircle(center, size.width / 5, paintOfCircle);
    showSmallCircle1
        ? canvas.drawCircle(Offset(166, 155), 5, paintOfSmallCircle)
        : "";
    showSmallCircle2
        ? canvas.drawCircle(Offset(164, 400), 5, paintOfSmallCircle)
        : "";
    showSmallCircle3
        ? canvas.drawCircle(Offset(30, 300), 5, paintOfSmallCircle)
        : "";
    canvas.drawCircle(
        Offset(size.width / 2, -size.height / 4), 5, paintOfSmallCircle);

    canvas.translate(size.width / 2, size.height / 2);

    canvas.rotate(rotationAngle);

    final outerPath = Path();
    outerPath.moveTo(0, 0);
    outerPath.lineTo(size.width / 2, -size.height);
    outerPath.lineTo(-size.width / 2, -size.height);
    outerPath.close();
    canvas.drawPath(outerPath, paintOfInnerTriangle);

    final innerPath = Path();
    innerPath.moveTo(0, 0);
    innerPath.lineTo(-size.width / 2, -size.height);
    innerPath.lineTo(-size.width / 0.9, -size.height);
    innerPath.close();

    showTriangle ? canvas.drawPath(innerPath, paintOfVector) : "";
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
