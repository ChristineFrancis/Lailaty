import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/captain_and_trip_info_row.dart';

class RequestToTeachDrivingAndWithYourModeContainer extends StatelessWidget {
  final VoidCallback toThePrivousPage;
  final VoidCallback onAccepted;
  final bool teachDrivingWidget;
  const RequestToTeachDrivingAndWithYourModeContainer({
    super.key,
    required this.onAccepted,
    required this.toThePrivousPage,
    this.teachDrivingWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.4,
      width: context.screenWidth,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TeachDrivingAndOnYourModeCaptainAndTripInfoRow(teachDrivingWidget: teachDrivingWidget),
            SizedBox(
              height: context.screenWidth * 0.02,
            ),
            const Divider(
              color: ColorManager.yellowTextColor,
              thickness: 1.5,
            ),
            SizedBox(
              height: context.screenWidth * 0.04,
            ),
            Center(
              child: MyButtonWidget(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                colors: ColorManager.yellowTextColor,
                widget: Center(
                  child: Text(
                    '${StringManager.examplePrice} ${StringManager.acceptancefor}',
                    style: StyleManager.boldTextStyle24(
                      size: context.screenHeight * 0.03,
                    ),
                  ),
                ),
                onpress: onAccepted,
              ),
            ),
            SizedBox(
              height: context.screenWidth * 0.02,
            ),
            InkWell(
              onTap: toThePrivousPage,
              child: Text(
                StringManager.skip,
                style: StyleManager.boldTextStyle24(
                  size: context.screenHeight * 0.03,
                  color: ColorManager.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
