import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class LineChartWidget extends StatefulWidget {
  final List<FlSpot> spots;
  const LineChartWidget({super.key, required this.spots});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.9,
      height: context.screenHeight * 0.2,
      child: LineChart(
        LineChartData(
          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              color: ColorManager.grey1,
              spots: widget.spots,
              isCurved: true,
              barWidth: 5,
              dotData: FlDotData(
                show: true,
                getDotPainter: (FlSpot spot, double xPercentage,
                    LineChartBarData bar, int index) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: ColorManager.yellowTextColor,
                  );
                },
              ),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          lineTouchData: LineTouchData(
            getTouchLineStart: (_, __) => double.infinity,
            getTouchLineEnd: (_, __) => double.infinity,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (LineBarSpot spot) => ColorManager.grey2,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  return LineTooltipItem(
                    '${spot.x.toInt()}, ${spot.y.toInt()}',
                    const TextStyle(color: ColorManager.whiteColor),
                  );
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}
