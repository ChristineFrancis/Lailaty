import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet_info/captain_model.dart';
import 'package:lailaty/feature/fleet_info/widgets/fleet_performance_widgets/captain_info_card.dart';
import 'package:lailaty/feature/fleet_info/widgets/fleet_performance_widgets/circular_progress_widget.dart';
import 'package:lailaty/feature/fleet_info/widgets/fleet_performance_widgets/line_chart_widget.dart';

class PerformanceContentWidget extends StatelessWidget {
  final double doneValue;
  final double totalValue;
  final List<FlSpot> chartSpots;
  final List<CaptainModel> captains;

  const PerformanceContentWidget({
    super.key,
    required this.doneValue,
    required this.totalValue,
    required this.chartSpots,
    required this.captains,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            StringManager.profits,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenWidth * 0.05,
            ),
          ),
          CircularProgressWidget(
            doneValue: doneValue,
            value: totalValue,
          ),
          Text(
            StringManager.numberOfFlights,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenWidth * 0.05,
            ),
          ),
          LineChartWidget(spots: chartSpots),
          Text(
            StringManager.mostActive,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenWidth * 0.05,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: captains.length,
              itemBuilder: (context, index) {
                return CaptainInfoCard(
                  imageUrl: captains[index].imageUrl,
                  name: captains[index].name,
                  carType: captains[index].carType,
                  progress: captains[index].progress,
                  rating: captains[index].rating,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
