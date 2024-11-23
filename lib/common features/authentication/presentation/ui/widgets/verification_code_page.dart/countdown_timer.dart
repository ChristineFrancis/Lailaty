import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  static const maxTime = 120;
  late Timer _timer;
  int _currentTime = maxTime;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        (_currentTime > 0) ? _currentTime-- : _timer.cancel();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TweenAnimationBuilder(
          tween: Tween(begin: 1.0, end: _currentTime / maxTime),
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
                  '${(_currentTime ~/ 60).toString().padLeft(2)}:${(_currentTime % 60).toString().padLeft(2, '0')} ',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }),
    );
  }
}
