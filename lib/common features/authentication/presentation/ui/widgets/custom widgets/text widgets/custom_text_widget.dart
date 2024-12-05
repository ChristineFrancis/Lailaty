import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  FontWeight? fontWeight;

   CustomTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;

    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp, // Font size relative to screen width
        fontWeight:fontWeight ?? FontWeight.bold,
        //fontFamily: "Segeo",
      ),
      textAlign: TextAlign.center, // Optional alignment
    );
  }
}
