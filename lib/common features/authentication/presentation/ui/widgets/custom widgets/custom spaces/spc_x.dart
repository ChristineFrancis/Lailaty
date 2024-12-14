import 'package:flutter/material.dart';

class SpcX extends StatelessWidget {
  final double x;
  const SpcX({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * x / 430,
    );
  }
}
