import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/map/presentation/widgets/captain_and_trip_info_row.dart';

//! to make the navigate depend on back
class WhileWaitingContainer extends StatelessWidget {
  final VoidCallback onAccepted;
  final bool teachDrivingWidget;
  const WhileWaitingContainer({
    super.key,
    required this.onAccepted,
    this.teachDrivingWidget = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.25,
      width: context.screenWidth,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: CaptainAndTripInfoRow(
        teachDrivingWidget: teachDrivingWidget,
      ),
    );
  }
}
