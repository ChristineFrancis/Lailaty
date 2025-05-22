import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/letter_circle.dart';

class CityRow extends StatelessWidget {
  final String city;
  final String letter;
  final Color backGroundColor;
  final double? radius;
  const CityRow({
    super.key,
    required this.city,
    required this.letter,
    required this.backGroundColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    double finalRadius = radius ?? context.screenWidth * 0.04;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //! change this to a choices?
        Text(
          city,
          style: StyleManager.semiboldTextStyle20(
            size: context.screenWidth * 0.05,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.03,
        ),
        LetterCircle(
          radius: finalRadius,
          letter: letter,
          backGroundColor: backGroundColor,
        ),
      ],
    );
  }
}
