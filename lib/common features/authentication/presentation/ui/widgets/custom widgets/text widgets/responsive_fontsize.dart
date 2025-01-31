import 'package:flutter/material.dart';

double getScalefactor(BuildContext context) {
  return MediaQuery.of(context).size.width / 375.0; // Base width for scaling
}

double getResponsiveText(double fontSize, BuildContext context) {
  double scalefactor = getScalefactor(context);
  double responsiveFontSize = fontSize * scalefactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}
