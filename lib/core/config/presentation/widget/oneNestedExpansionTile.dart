// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class myExpansionTile extends StatelessWidget {
  String text1;

  List<Widget> children;
  Color primaryColor;

  myExpansionTile({
    Key? key,
    required this.text1,
    required this.children,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: HeaderText(
          text: text1,
          styleOfText: StyleManager.miniSmallText14(),
        ),
        backgroundColor: primaryColor,
        collapsedShape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        collapsedBackgroundColor: primaryColor,
        textColor: primaryColor,
        iconColor: ColorManager.blackColor,
        children: children);
  }
}
