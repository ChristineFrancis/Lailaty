import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/style_maneger.dart';
import 'myButton.dart';

class acceptButtonCustomer extends StatelessWidget {
  void Function() onPress;
  acceptButtonCustomer({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return MyButton(
        styleOfTExt: StyleManager.normalText18(),
        title: StringManager.tam,
        onpress: onPress,
        colors: ColorManager.semiBoldyellow,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 15,
        radius: 18);
  }
}
