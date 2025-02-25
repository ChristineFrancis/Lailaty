import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet_info/captain_model.dart';
import 'package:lailaty/feature/fleet_info/presentation/widgets/fleet_performance_widgets/performance_content_widget.dart';

class DayContentWidget extends StatelessWidget {
  const DayContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PerformanceContentWidget(
      doneValue: 50,
      totalValue: 500,
      chartSpots: const [
        FlSpot(0, 2),
        FlSpot(1, 3),
        FlSpot(2, 5),
        FlSpot(3, 4),
        FlSpot(4, 3),
      ],
      captains: [
        CaptainModel(
          imageUrl: ImageAssetManager.arrowIcon,
          name: StringManager.exampleCaptainName,
          carType: StringManager.examplePrice,
          progress: 0.6,
          rating: 4.2,
        ),
      ],
    );
  }
}
