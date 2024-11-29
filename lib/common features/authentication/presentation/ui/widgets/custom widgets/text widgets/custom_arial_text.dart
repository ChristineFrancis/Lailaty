import 'package:flutter/material.dart';

class CustomArialText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const CustomArialText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: screenWidth *
            fontSize *
            0.0027, // Font size relative to screen width
        fontWeight: FontWeight.bold,
        fontFamily: "Arial",
      ),
      textAlign: TextAlign.center, // Optional alignment
    );
  }
}
