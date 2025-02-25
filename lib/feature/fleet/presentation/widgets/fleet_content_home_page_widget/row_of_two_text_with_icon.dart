import 'package:flutter/material.dart';

import '../../../../../core/config/presentation/widget/Titles.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_maneger.dart';

class twoTextWithIconsInRow extends StatelessWidget {
  String textTrendUp;
  String textStar;
  twoTextWithIconsInRow({
    required this.textStar,
    required this.textTrendUp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Icon(Icons.trending_up),
            HeaderText(
                text: textTrendUp, styleOfText: StyleManager.miniSmallText14())
          ],
        ),
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.yellow
              ,
            ),
            HeaderText(text: "1", styleOfText: StyleManager.miniSmallText14())
          ],
        )
      ],
    );
  }
}
