import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/presentation/widget/journy_details_row.dart';

// this container used in three way :
//1) have arrived
//2) the journey completed
//3) start The Journey

class HaveArrivedOrJourneyCompletedContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String containerName;
  final bool justOnePath;

  const HaveArrivedOrJourneyCompletedContainer({
    super.key,
    required this.onTap,
    required this.containerName,
    required this.justOnePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: context.screenHeight * 0.3,
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
                    containerName,
                    style: StyleManager.boldTextStyle24(
                      size: context.screenHeight * 0.03,
                    ),
                  ),
                ),
                onpress: onTap,
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
