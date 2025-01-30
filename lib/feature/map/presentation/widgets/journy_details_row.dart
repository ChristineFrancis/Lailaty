import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/captain_name_and_rating_widget.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class JournyDetailsRow extends StatelessWidget {
  const JournyDetailsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: context.screenWidth * 0.04,
              backgroundColor: ColorManager.yellowTextColor,
              child: const Icon(
                Icons.phone_outlined,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            CircleAvatar(
              radius: context.screenWidth * 0.04,
              backgroundColor: ColorManager.yellowTextColor,
              child: const Icon(
                Icons.message_outlined,
                color: ColorManager.black,
              ),
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const CityRow(
              city: StringManager.alexandriaStreetExample,
              backGroundColor: ColorManager.blueCircleColor,
              letter: StringManager.aLetter,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            const CityRow(
              city: StringManager.alexandriaStreetExample,
              backGroundColor: ColorManager.brightGreen,
              letter: StringManager.bLetter,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Text(
              StringManager.payExample,
              textAlign: TextAlign.right,
              style: StyleManager.semiboldTextStyle20(
                size: context.screenWidth * 0.05,
              ),
            ),
          ],
        ),
        //captain :
        const CaptainNameAndRating(),
      ],
    );
  }
}
