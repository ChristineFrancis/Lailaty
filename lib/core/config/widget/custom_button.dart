// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.title,
    required this.onpress,
    required this.colors,
    required this.width,
    required this.height,
    required this.radius,
    this.textcolor,
    this.fontsize,
    this.icon,
    this.colorIcon,
    this.sixeIcon,
  });

  final String? title;
  final Color? colorIcon;
  final double? sixeIcon;
  final IconData? icon;
  final VoidCallback onpress;
  final Color? colors;
  final Color? textcolor;
  final double width;
  final double height;
  final double radius;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: InkWell(
        onTap: onpress,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius), color: colors),
          margin: EdgeInsets.only(left: 6),
          width: width,
          height: height,
          child: Center(
              child: title != null
                  ? Text(
                      title!,
                      style: TextStyle(
                          fontSize: fontsize,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )
                  : Icon(
                      icon!,
                      color: colorIcon,
                      size: sixeIcon,
                    )),
        ),
      ),
    );
  }
}