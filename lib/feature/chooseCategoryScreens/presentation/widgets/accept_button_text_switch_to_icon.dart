import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/config/widget/myButton.dart';
import 'package:lailaty/core/config/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class acceptButtonCustomerWithSwitchIcon extends StatelessWidget {
  void Function() onPress;
  bool isRegister;
  double? width;
  double? height;
  Color? color;
  acceptButtonCustomerWithSwitchIcon(
      {super.key,
      required this.isRegister,
      required this.onPress,
      this.height,
      this.color,
      this.width});

  @override
  Widget build(BuildContext context) {
    // width = MediaQuery.of(context).size.width / 2;
    // height = MediaQuery.of(context).size.height / 15;
    return MyButtonWidget(
        fontsize: 16,
        widget: isRegister
            ? const Icon(
                Icons.task_alt,
                color: ColorManager.black,
              )
            : HeaderText(
                text: StringManager.rigester,
                styleOfText:
                    StyleManager.miniSmallText14(fontWeight: FontWeight.w600)),
        onpress: onPress,
        colors: color ?? ColorManager.yellowAccent,
        width: width ?? MediaQuery.of(context).size.width / 2,
        height: height ?? MediaQuery.of(context).size.height / 15,
        radius: 18);
  }
}
