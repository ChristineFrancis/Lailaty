import 'package:flutter/material.dart';

import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';

import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_content_home_views/fleet.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_content_home_views/new_order.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_home_page_widget/fleet_page_bottom_bar.dart';

class fleetHomePageView extends StatefulWidget {
  fleetHomePageView({super.key});

  @override
  State<fleetHomePageView> createState() => _fleetHomePageViewState();
}

class _fleetHomePageViewState extends State<fleetHomePageView> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    List pages = [
      const FleetContentView(),
      const NewOrderContentFleetView(),
    ];

    return Scaffold(
        appBar: CustomAppbar(
          ispop: true,
          title: StringManager.fleet,
        ),
        // appBar: AppBar(
        //   actions: [
        //     Builder(
        //       builder: (context) => IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.arrow_forward),
        //         color: ColorManager.blackColor,
        //       ),
        //     )
        //   ],
        //   backgroundColor: ColorManager.greyTextr,
        //   title: Center(
        //     child: HeaderText(
        //         text: StringManager.fleet,
        //         styleOfText: StyleManager.semiboldTextStyle20()),
        //   ),
        // ),
        body: pages[currentIndex],
        bottomNavigationBar: fleetPageBottomBar(
            context: context,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            }));
  }
}
