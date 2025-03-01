import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CountdownTimer extends StatefulWidget {
  final int maxTime; // in seconds
  final VoidCallback? onTimerComplete;
  const CountdownTimer({super.key, this.maxTime = 600, this.onTimerComplete});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  late int _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.maxTime;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime > 0) {
        setState(() {
          _currentTime--;
        });
      } else {
        _timer.cancel();
        if (widget.onTimerComplete != null) {
          widget.onTimerComplete!();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: _currentTime / widget.maxTime),
      duration: const Duration(seconds: 1),
      builder: (context, double value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 4,
                valueColor: const AlwaysStoppedAnimation<Color>(
                    ColorManager.yellow),
              ),
            ),
            Text(
              '${(_currentTime ~/ 60).toString().padLeft(2, '0')}:${(_currentTime % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
