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
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HeaderText(
            text: text,
            styleOfText: StyleManager.normalText18(color: ColorManager.black),
          ),
          const SizedBox(
            width: 6,
          ),
          SizedBox(
            width: widthOfExpansionTile,
            child: myExpansionTile(
              text1: textOfOption,
              primaryColor: ColorManager.greyWithOpacity,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
