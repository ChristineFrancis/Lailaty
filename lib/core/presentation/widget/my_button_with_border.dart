// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class myButtonWithBorder extends StatelessWidget {
  String text;
  Color colorBorder;
  double? width;

  void Function()? onpressed;
  myButtonWithBorder({
    Key? key,
    required this.text,
    required this.colorBorder,
    this.width,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width / 1,
      child: OutlinedButton(
          onPressed: onpressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: colorBorder,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: ColorManager.black),
          )),
    );
  }
}
