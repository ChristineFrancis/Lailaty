// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/imageProduct.dart';

import '../../../core/config/presentation/widget/Titles.dart';
import '../../../core/resources/asset_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/style_maneger.dart';

class nameWithStars extends StatelessWidget {
  final String name;
  final String starRating;
  const nameWithStars({
    Key? key,
    required this.name,
    required this.starRating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       ImageProduct(image: ImageAssetManager.caporlehCarPic,),
        HeaderText(text: name, styleOfText: StyleManager.miniSmallText14()),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: ColorManager.yellowAccent, size: 15),
            HeaderText(
                text: starRating, styleOfText: StyleManager.grySmallText12())
          ],
        )
      ],
    );
  }
}
