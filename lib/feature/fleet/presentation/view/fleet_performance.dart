import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_performance_widgets/day_content_widget.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_performance_widgets/month_content_widget.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_performance_widgets/week_content_widget.dart';

class FleetPerformancePage extends StatelessWidget {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(2);

  final List<String> sections = [
    StringManager.month,
    StringManager.week,
    StringManager.day,
  ];
  final List<Widget> content = const [
    MonthContentWidget(),
    WeekContentWidget(),
    DayContentWidget(),
  ];

  FleetPerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.fleetPerformance,
      ),
      backgroundColor: ColorManager.backGroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.grey1,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(context.screenWidth * 0.005),
                child: ValueListenableBuilder<int>(
                  valueListenable: selectedIndex,
                  builder: (context, value, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(sections.length, (index) {
                        bool isSelected = value == index;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => selectedIndex.value = index,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.screenWidth * 0.05,
                                vertical: context.screenHeight * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? ColorManager.yellowTextColor
                                    : ColorManager.transparentColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  sections[index],
                                  style: StyleManager.miniSmallText14(
                                    size: context.screenWidth * 0.045,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: context.screenHeight * 0.02),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: content[value],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
