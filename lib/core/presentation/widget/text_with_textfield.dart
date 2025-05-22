import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/presentation/widget/myTextField.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import '../../resources/style_maneger.dart';

class TextWithTextfield extends StatelessWidget {
  final String text;
  final String textOfOption;
  TextEditingController controller;
 final String validatorText;

  TextWithTextfield({
    super.key,
    required this.controller,
    required this.text,
    required this.textOfOption, required this.validatorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: HeaderText(
              text: text,
              styleOfText: StyleManager.normalText18(color: ColorManager.black),
            ),
          ),
          const SizedBox(
            width: 11,
          ),
          Flexible(
            // width: widthOfExpansionTile,
            child: myTextFieldName(
              nameText: textOfOption,
              primaryColor: ColorManager.grey1,
              readOnly: false,
              nameController: controller,
               validatorText: validatorText,
            ),
          ),
        ],
      ),
    );
  }
}
