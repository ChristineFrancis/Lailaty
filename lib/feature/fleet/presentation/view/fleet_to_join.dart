import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_to_join_widget/search_container.dart';

import '../widgets/fleet_to_join_widget/custom_dropdown.dart';

class FleetToJoinPage extends StatelessWidget {
  const FleetToJoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: '',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Text(
                StringManager.enterTheNameOfTheFleetYouWantToJoin,
                style: StyleManager.semiboldTextStyle20(
                  color: ColorManager.black,
                  size: context.screenWidth * 0.05,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: context.screenWidth * 0.05),
                  child: Text(
                    StringManager.fleetName,
                    style: StyleManager.semiboldTextStyle20(
                      color: ColorManager.black,
                      size: context.screenWidth * 0.05,
                    ),
                  ),
                ),
              ),
              const SearchContainer(),
              const CustomDropdown(),
              SizedBox(
                height: context.screenHeight * 0.4,
              ),
              MyButton(
                title: StringManager.next,
                onpress: () {
                  //to navigate
                  context.push(AppKeys.personalInformationPageKey);
                },
                colors: ColorManager.grey1,
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                styleOfTExt: StyleManager.semiboldTextStyle20(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
