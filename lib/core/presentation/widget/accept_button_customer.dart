import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/style_maneger.dart';
import 'myButton.dart';

class acceptButtonCustomer extends StatelessWidget {
  void Function() onPress;
  String text;
  double? width;
  double? height;
  acceptButtonCustomer(
      {super.key,
      required this.text,
      required this.onPress,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width / 2;
    // height = MediaQuery.of(context).size.height / 15;
    return MyButton(
        styleOfTExt: StyleManager.normalText18(),
        title: text,
        onpress: onPress,
        colors: ColorManager.grey1,
        width: width ?? MediaQuery.of(context).size.width / 2,
        height: height ?? MediaQuery.of(context).size.height / 15,
        radius: 11);
  }
}
