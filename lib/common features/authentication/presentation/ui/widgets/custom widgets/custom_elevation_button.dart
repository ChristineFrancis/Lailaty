import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width and calculate button width as a percentage
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.7; // 80% of screen width

    return SizedBox(
      height: 40, // Fixed height for the button
      width: buttonWidth, // Responsive width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.yellow,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
