import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 5) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        /*appBar: AppBar(
          backgroundColor: ColorManager.grey,
          leading: _currentPage > 0
              ? IconButton(
                  onPressed: _previousPage,
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorManager.yellow,
                  ))
              : null,
        ),*/
        body: Stack(
          children: [
            Container(color: ColorManager.grey),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.grey200,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.only(
                  left: screenWidth * 25 / 430,
                  right: screenWidth * 25 / 430,
                  top: screenHeight * 139 / 932,
                  bottom: screenHeight * 133 / 932,
                ),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) => setState(() => _currentPage = page),
                  children: [
                    _myFeature(),
                    _myFeature(),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: screenHeight * 372 / 932,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) => _buildIndicator(index)),
                )),
            Positioned(
              bottom: screenHeight * 35 / 932,
              left: screenWidth * 67 / 430,
              right: screenWidth * 67 / 430,
              child: CustomButton(
                textButton: 'التالي',
                onTap: _nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myFeature() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
            text: 'تعليم القيادة', fontSize: 36, color: Colors.black),
        SpcY(y: 80),
        SvgPicture.asset(ImageAssetManager.onBoardingLearnDriving),
      ],
    );
  }

  Widget _buildIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
          color: _currentPage == index
              ? ColorManager.yellow
              : ColorManager.grey100,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
