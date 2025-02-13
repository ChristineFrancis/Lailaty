import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class SelectDestinationContainer extends StatelessWidget {
  final VoidCallback toJourneyCompleted;

  const SelectDestinationContainer(
      {super.key, required this.toJourneyCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.3,
      width: context.screenWidth,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: Center(
        child: Column(
          children: [
            Text(
              StringManager.selectDestination,
              style: StyleManager.boldTextStyle24(
                color: ColorManager.black,
                size: context.screenWidth * 0.05,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            GestureDetector(
              onTap: () {
                print(
                    "Selected City: ${StringManager.alexandriaStreetExample}");
                toJourneyCompleted();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.greyRateContainer,
                ),
                child: const CityRow(
                  city: StringManager.alexandriaStreetExample,
                  letter: StringManager.bLetter,
                  backGroundColor: ColorManager.brightGreen,
                ),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            GestureDetector(
              onTap: toJourneyCompleted,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.greyRateContainer,
                ),
                child: const CityRow(
                  city: StringManager.alexandriaStreetExample,
                  letter: StringManager.clearFace,
                  backGroundColor: ColorManager.brightGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
