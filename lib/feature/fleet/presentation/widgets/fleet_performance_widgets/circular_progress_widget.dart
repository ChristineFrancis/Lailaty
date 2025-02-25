import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet_info/presentation/widgets/fleet_performance_widgets/circular_progress_painter.dart';

class CircularProgressWidget extends StatefulWidget {
  final double doneValue;
  final double value;
  const CircularProgressWidget(
      {super.key, required this.doneValue, required this.value});

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget> {
  late double progress;
  bool isTapped = false;

  @override
  void initState() {
    super.initState();
    _updateProgress();
  }

  @override
  void didUpdateWidget(covariant CircularProgressWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateProgress();
  }

  void _updateProgress() {
    setState(() {
      progress = (widget.doneValue / widget.value).clamp(0.0, 1.0);
    });
  }

  void _onTap(Offset tapPosition, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double dx = tapPosition.dx - centerX;
    double dy = tapPosition.dy - centerY;
    double angle = atan2(dy, dx) + pi / 2;

    if (angle < 0) angle += 2 * pi;
    double progressAngle = 2 * pi * progress;

    if (angle <= progressAngle) {
      setState(() {
        isTapped = !isTapped;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapUp: (details) {
          RenderBox box = context.findRenderObject() as RenderBox;
          _onTap(box.globalToLocal(details.globalPosition), box.size);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: context.screenWidth * 0.35,
          height: context.screenWidth * 0.35,
          child: CustomPaint(
            painter: CircularProgressPainter(progress, isTapped),
          ),
        ),
      ),
    );
  }
}
