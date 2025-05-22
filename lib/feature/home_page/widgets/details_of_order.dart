// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/letter_circle.dart';

import '../../../core/presentation/widget/Titles.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/style_maneger.dart';

class detailsOfOrder extends StatelessWidget {
  final String typeOrder;
  final String distance;
  final String price;
  final String aPoint;
  final String bPoint;
  const detailsOfOrder({
    Key? key,
    required this.typeOrder,
    required this.distance,
    required this.price,
    required this.aPoint,
    required this.bPoint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(
              text: typeOrder,
              styleOfText:
                  StyleManager.normalText18(fontWeight: FontWeight.w600)),
          HeaderText(
            text: distance,
            styleOfText:
                StyleManager.normalText18(color: ColorManager.whiteColor),
          ),
          HeaderText(
              text: price,
              styleOfText: StyleManager.miniSmallText14(
                  fontWeight: FontWeight.w700, color: ColorManager.black)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: LetterCircle(
                    backGroundColor: ColorManager.blueCircleColor, letter: "A"),
              ),
              Expanded(
                child: HeaderText(
                    text: aPoint, styleOfText: StyleManager.grySmallText12()),
              )
            ],
          ),
          // SizedBox(
          //   height: 2,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(3.0),
                child: LetterCircle(
                    backGroundColor: ColorManager.brightGreen, letter: "B"),
              ),
              Expanded(
                child: HeaderText(
                    text: bPoint, styleOfText: StyleManager.grySmallText12()),
              )
            ],
          ),
        ],
      ),
    );
  }
}
