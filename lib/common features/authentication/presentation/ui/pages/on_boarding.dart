import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/login_with_email_page.dart';
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
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginWithEmailPage()),
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
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
        body: Stack(
          children: [
            Container(color: ColorManager.grey),
            Visibility(
              visible: _currentPage > 0,
              child: Positioned(
                top: screenHeight * 34 / 932,
                right: screenWidth * 15 / 430,
                child: IconButton(
                  onPressed: _previousPage,
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorManager.yellow,
                  ),
                ),
              ),
            ),
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
                    _myFeature(
                      'رجال أعمال',
                      'تبدأ رحلتك باحدث طراز سيارات\nلمشاوير رجال الأعمال',
                      ImageAssetManager.onBoardingBusinessMen,
                    ),
                    _myFeature(
                      'زفاف',
                      'اختر سيارتك لليلة العمر\nبنوفرلك افخم سيارات الزفاف وسهولة\nفي الاختيار وراحة وامان وسعر عادل',
                      ImageAssetManager.onBoardingWedding,
                    ),
                    _myFeature(
                      'تعليم القيادة',
                      'نبدأ تعليم القيادة بكل سهولة وامان\nوبسعر مناسب للطرفين',
                      ImageAssetManager.onBoardingLearnDriving,
                    ),
                    _myFeature(
                      'رحلات داخلية',
                      'يمكنك طلب سيارتك للوصول\nلوجهتك في دقائق بكل سهولة وامان',
                      ImageAssetManager.onBoardingInnerTrip,
                    ),
                    _myFeature(
                      'على مودك',
                      'نوفر لك جميع السيارات اكثر راحة\nوذات رفاهية لإتمام مشاويرك للتسوق\nوالتنزه وجميع المشاوير الخاصة',
                      ImageAssetManager.onBoardingAlaModak,
                    ),
                    _myFeature(
                      'سفر',
                      'يمكنك طلب سيارتك للتنقل بين المدن\nبراحة وامان وسعر عادل للطرفين',
                      ImageAssetManager.onBoardingAlaModak,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: screenHeight * 320 / 932,
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

  Widget _myFeature(String title, String text, String picture) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(text: title, fontSize: 37, color: Colors.black),
            SpcY(y: 75),
            SvgPicture.asset(
              picture,
              height: MediaQuery.of(context).size.height * 200 / 932,
            ),
          ],
        ),
        CustomTextWidget(text: text, fontSize: 19, color: Colors.black),
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
