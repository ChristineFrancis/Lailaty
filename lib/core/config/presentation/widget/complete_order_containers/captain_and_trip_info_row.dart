import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/captain/captain_name_and_rating_widget.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class TeachDrivingAndOnYourModeCaptainAndTripInfoRow extends StatelessWidget {
  const TeachDrivingAndOnYourModeCaptainAndTripInfoRow({
    super.key,
    required this.teachDrivingWidget,
  });

  final bool teachDrivingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: context.screenWidth * 0.02,
            ),
            Text(
              "٢ ${StringManager.hours}",
              style: StyleManager.normalText18(
                color: ColorManager.backGroundColor,
                size: context.screenWidth * 0.04,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.008),
            (teachDrivingWidget)
                ? Text(
                    "٢ ${StringManager.day}",
                    style: StyleManager.normalText18(
                      color: ColorManager.backGroundColor,
                      size: context.screenWidth * 0.04,
                    ),
                  )
                : const SizedBox.shrink(),
            SizedBox(
              height: context.screenWidth * 0.02,
            ),
            Text(
              StringManager.examplePrice,
              style: StyleManager.semiboldTextStyle20(
                color: ColorManager.black,
                size: context.screenWidth * 0.06,
              ),
            ),
            SizedBox(
              height: context.screenWidth * 0.04,
            ),
            const CityRow(
              city: StringManager.alexandriaStreetExample,
              backGroundColor: ColorManager.blueCircleColor,
              letter: StringManager.aLetter,
            ),
          ],
        ),
        SizedBox(
          width: context.screenWidth * 0.06,
        ),
        Padding(
          padding: EdgeInsets.only(top: context.screenHeight * 0.04),
          child: const CaptainNameAndRating(),
        ),
      ],
    );
  }
}
