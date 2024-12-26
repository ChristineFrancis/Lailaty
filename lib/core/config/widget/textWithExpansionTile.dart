import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import '../../resources/string_manager.dart';
import '../../resources/style_maneger.dart';
import 'oneNestedExpansionTile.dart';

class textWithExpansionTile extends StatelessWidget {
  final String text;
  final String textOfOption;
  double widthOfExpansionTile;
  textWithExpansionTile({
    super.key,
    required this.widthOfExpansionTile,
    required this.text,
    required this.textOfOption,
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
            child: myExpansionTile(
              text1: textOfOption,
              primaryColor: ColorManager.whiteColor,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
