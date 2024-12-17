import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  FontWeight? fontWeight;

  CustomTextWidget(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeigth = MediaQuery.of(context).size.height;

    return Text(
      text,
      style: TextStyle(
        height: screenHeigth * 0.0017,
        color: color,
        fontSize: getResponsiveText(
            fontSize, context), // Font size relative to screen width
        fontWeight: fontWeight ?? FontWeight.bold,
        //fontFamily: "Segeo",
      ),
      textAlign: TextAlign.center,
    );
  }
}

double getResponsiveText(double fontSize, BuildContext context) {
  double scalefactor = getScalefactor(context);
  double responsiveFontSize = fontSize * scalefactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);

  // double screenWidth = MediaQuery.of(context).size.width;
  // if (screenWidth>800)
  // {
  //   return fontSize.sp * 0.4;
  // }
  // else if (screenWidth<500)
  // {
  //   return fontSize.sp * 0.5;
  // }
  // else if (screenWidth<400)
  // {
  //   return fontSize.sp * 0.0002;
  // }
  // else
  // {
  //   return fontSize.sp;
  // }
}

double getScalefactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
