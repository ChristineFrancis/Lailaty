import 'package:flutter/material.dart';

class SpcY extends StatelessWidget {
  final double y;
  const SpcY({super.key, required this.y});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * (y / 932),
    );
  }
}
