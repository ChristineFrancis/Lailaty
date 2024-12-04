import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color buttonColor;
  final double fontSize;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.buttonColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.7;

    return SizedBox(
      height: screenHeight * 0.05, 
      width: buttonWidth, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
