import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class CustomTextArial extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const CustomTextArial({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: getResponsiveText(fontSize, context),
        fontWeight: FontWeight.bold,
        fontFamily: "Arial",
      ),
      textAlign: TextAlign.center, // Optional alignment
    );
  }
}

double getResponsiveText(double fontSize, BuildContext context) {
  double scalefactor = getScalefactor(context);
  double responsiveFontSize = fontSize * scalefactor;
  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
