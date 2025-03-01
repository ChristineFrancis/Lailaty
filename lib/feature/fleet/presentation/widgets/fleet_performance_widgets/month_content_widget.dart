import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/captain_model.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_performance_widgets/performance_content_widget.dart';

class MonthContentWidget extends StatelessWidget {
  const MonthContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PerformanceContentWidget(
      doneValue: 200,
      totalValue: 1000,
      chartSpots: const [
        FlSpot(0, 4.5),
        FlSpot(3, 2),
        FlSpot(5, 4),
        FlSpot(7, 3),
        FlSpot(8, 4),
        FlSpot(10, 3),
      ],
      captains: [
        CaptainModel(
          imageUrl: ImageAssetManager.arrowIcon,
          name: StringManager.exampleCaptainName,
          carType: StringManager.meterExample,
          progress: 0.7,
          rating: 4.8,
        ),
        CaptainModel(
          imageUrl: ImageAssetManager.arrowIcon,
          name: StringManager.exampleCaptainName,
          carType: StringManager.meterExample,
          progress: 0.7,
          rating: 4.8,
        ),
    ],
    );
  }
}
