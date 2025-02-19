import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet_info/widgets/month_content_widget.dart';

class FleetPerformancePage extends StatelessWidget {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(1);

  final List<String> sections = [
    StringManager.month,
    StringManager.week,
    StringManager.day,
  ];
  final List<Widget> content = const [
    MonthContentWidget(),
    Center(child: Text("محتوى الأسبوع", style: TextStyle(fontSize: 24))),
    Center(child: Text("محتوى اليوم", style: TextStyle(fontSize: 24))),
  ];

  FleetPerformancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        ispop: true,
        title: '',
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
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.grey1,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(2),
              child: ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(sections.length, (index) {
                      bool isSelected = value == index;
                      return GestureDetector(
                        onTap: () => selectedIndex.value = index,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
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
                      );
                    }),
                  );
                },
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
