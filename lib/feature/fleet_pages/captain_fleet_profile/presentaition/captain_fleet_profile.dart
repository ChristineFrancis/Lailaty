// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/feature/fleet_pages/captain_fleet_profile/widget/car_profile.dart';

import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/config/presentation/widget/imageProduct.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/resources/string_manager.dart';

class CaptainFleetProfile extends StatefulWidget {
  const CaptainFleetProfile({super.key});

  @override
  _CaptainFleetProfileState createState() => _CaptainFleetProfileState();
}

class _CaptainFleetProfileState extends State<CaptainFleetProfile> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: CustomAppbar(title: StringManager.profileTitle, ispop: false),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ImageProduct(image: "image"),
              const SizedBox(height: 8),
              HeaderText(
                  text: 'محمد الأحمد',
                  styleOfText: StyleManager.normalText18()),
              const SizedBox(height: 16),
              const Divider(
                color: ColorManager.grey1,
                indent: 22,
                endIndent: 22,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 7,
                child: SizedBox(
                  height: context.screenHeight * 0.3,
                  width: context.screenWidth * 0.8,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ImageProduct(image: "d");
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.yellow,
                  dotColor: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              containerOfProfile(
                colorCar: "احمر",
                nameCar: "سيراتو",
                numberCar: "2",
                yearMade: "2000",
                onPressAccept: () {},
                onPressRefuse: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
