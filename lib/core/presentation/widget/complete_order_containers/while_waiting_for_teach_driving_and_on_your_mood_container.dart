import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/captain_and_trip_info_row.dart';

//! to make the navigate depend on back
class WhileWaitingForTeachDrivingAndOnYourMoodContainer
    extends StatelessWidget {
  final VoidCallback onAccepted;
  final bool teachDrivingWidget;
  const WhileWaitingForTeachDrivingAndOnYourMoodContainer({
    super.key,
    required this.onAccepted,
    this.teachDrivingWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    //! change this and like it with back
    Future.delayed(const Duration(seconds: 3), onAccepted);
    return Container(
      height: context.screenHeight * 0.28,
      width: context.screenWidth,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: TeachDrivingAndOnYourModeCaptainAndTripInfoRow(
        teachDrivingWidget: teachDrivingWidget,
      ),
    );
  }
}
