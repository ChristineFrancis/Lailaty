import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet_info/captain_model.dart';
import 'package:lailaty/feature/fleet_info/presentation/widgets/fleet_performance_widgets/performance_content_widget.dart';

class WeekContentWidget extends StatelessWidget {
  const WeekContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PerformanceContentWidget(
      doneValue: 300,
      totalValue: 500,
      chartSpots: const [
        FlSpot(0, 3),
        FlSpot(2, 5),
        FlSpot(4, 2),
        FlSpot(6, 4),
        FlSpot(8, 3),
        FlSpot(10, 4),
      ],
      captains: [
        CaptainModel(
          imageUrl: ImageAssetManager.arrowIcon,
          name: StringManager.exampleCaptainName,
          carType: StringManager.meterExample,
          progress: 0.8,
          rating: 4.5,
        ),
      ],
    );
  }
}
