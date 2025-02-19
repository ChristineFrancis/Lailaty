import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet_info/widgets/fleet_option_container.dart';

class FleetOptionsPage extends StatelessWidget {
  const FleetOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        ispop: false,
        title: '',
      ),
      backgroundColor: ColorManager.backGroundColor,
      body: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          FleetOptionContainer(
            onTap: () {
              context.push(AppKeys.fleetHomePageViewPath);
            },
            optionTitle: StringManager.fleet,
            optionIcon: Icons.directions_car_outlined,
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          FleetOptionContainer(
            onTap: () {
              context.push(
                AppKeys.fleetPerformancePage,
              );
            },
            optionTitle: StringManager.fleetPerformance,
            optionIcon: Icons.trending_up,
          ),
        ],
      ),
    );
  }
}
