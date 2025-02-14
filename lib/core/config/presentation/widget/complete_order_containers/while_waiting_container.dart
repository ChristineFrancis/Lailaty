import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/captain/captain_name_and_rating_widget.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/from_and_to_city_column_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

// ! after here
//if user accepte it will go to the i have arrived container
//if user refuse it will go to the

class WhileWaitingContainer extends StatelessWidget {
  final VoidCallback onAccepted;
  final VoidCallback onRefuse;
  final bool teachDrivingWidget;
  const WhileWaitingContainer({
    super.key,
    required this.onAccepted,
    this.teachDrivingWidget = true,
    required this.onRefuse,
  });

  @override
  Widget build(BuildContext context) {
    //! change this and like it with back
    //if its refused so he will go to the onRefuse
    //else it will go to the onAccepted
    Future.delayed(const Duration(seconds: 3), onAccepted);
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              StringManager.meterExample + StringManager.meter,
              style: StyleManager.normalText18(
                size: context.screenWidth * 0.05,
                color: ColorManager.whiteColor,
              ),
            ),
            Text(
              StringManager.examplePrice,
              style: StyleManager.semiboldTextStyle20(
                color: ColorManager.black,
                size: context.screenWidth * 0.06,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FromAndToCityColumnWidget(
                  city1: StringManager.alexandriaStreetExample,
                  city2: StringManager.alexandriaStreetExample,
                ),
                CaptainNameAndRating(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
