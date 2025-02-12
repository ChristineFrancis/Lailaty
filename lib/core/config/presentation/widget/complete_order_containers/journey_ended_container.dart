import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/config/presentation/widget/journy_details_row.dart';

class JourneyEndedContainer extends StatelessWidget {
  final VoidCallback toJourneyCompleted;
  final VoidCallback toRateJourney;
  final bool justOnePath;
  const JourneyEndedContainer({
    super.key,
    required this.toJourneyCompleted,
    required this.toRateJourney,
    required this.justOnePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Text(
              StringManager.isTheTripOver,
              style: StyleManager.boldTextStyle24(
                size: context.screenWidth * 0.075,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            JournyDetailsRow(
              justOnePath: justOnePath,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Center(
              child: MyButtonWidget(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                colors: ColorManager.yellowTextColor,
                widget: Center(
                  child: Text(
                    StringManager.yes,
                    style: StyleManager.boldTextStyle24(
                      size: context.screenHeight * 0.03,
                    ),
                  ),
                ),
                onpress: toRateJourney,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            InkWell(
              onTap: toJourneyCompleted,
              child: Center(
                child: Text(
                  StringManager.no,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenHeight * 0.02,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
