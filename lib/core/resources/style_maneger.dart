import 'dart:ui';

import 'package:flutter/material.dart';

import 'color_manager.dart';

class StyleManager {
  static TextStyle boldTextStyle24({
    Color color = ColorManager.black,
    double size = 24,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        fontFamily: "Poppins");
  }

  static TextStyle semiboldTextStyle20({
    Color color = ColorManager.black,
    double size = 20,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        fontFamily: "Poppins");
  }

  static TextStyle smallBlackText16({
    Color color = ColorManager.black,
    double size = 16,
  }) {
    return TextStyle(
      color: color,
      fontFamily: "Poppins",
       decoration: TextDecoration.none,
      fontSize: size,
    );
  }

  static TextStyle miniSmallText14({
    Color color = ColorManager.black,
    double size = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontFamily: "Poppins", decoration: TextDecoration.none,
        fontWeight: fontWeight);
  }

  static TextStyle normalText18({
    Color color = ColorManager.black,
    double size = 18,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontFamily: "Poppins",
        decoration: TextDecoration.none,
        fontWeight: fontWeight);
  }

  static TextStyle grySmallText12({
    Color color = ColorManager.black,
    double size = 12,
    FontWeight fontWeight = FontWeight.normal,

  }) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontFamily: "Poppins",
         decoration: TextDecoration.none,
        fontWeight: fontWeight);
  }
}
