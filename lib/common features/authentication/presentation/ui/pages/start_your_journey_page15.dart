import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_arial.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/start_your_journey_page15/car_selection_dialog.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/start_your_journey_page15/car_selection_dialog_with_search.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/start_your_journey_page15/choose_service_card.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/start_your_journey_page15/start_your_journey_appbar.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class StartYourJourneyPage15 extends StatelessWidget {
  const StartYourJourneyPage15({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.grey100,
      appBar: StartYourJourneyAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  mainAxisExtent: screenHeight * 210 / 932,
                ),
                children: [
                  ChooseServiceCard(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                CarSelectionDialogWithSearch());
                      },
                      svgPictureName: ImageAssetManager.drivingEduCarPic,
                      containerColor: ColorManager.grey,
                      firstText: 'تعليم قيادة',
                      firstTextColor: ColorManager.yellow,
                      secondText:
                          'ابدأ تعلم القيادة الآن\n مع كابتن ليلتي في امان و راحة\n\n'),
                  ChooseServiceCard(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => CarSelectionDialog());
                      },
                      svgPictureName: ImageAssetManager.weddingCarPic,
                      containerColor: ColorManager.grey,
                      firstText: 'زفاف-رجال أعمال',
                      firstTextColor: ColorManager.yellow,
                      secondText:
                          "جميع انواع السيارات ذات الرفاهية\n مناسبة لحفلات الزفاف و جميع المناسبات و مشاوير رجال الاعمال\n"),
                  ChooseServiceCard(
                      svgPictureName: ImageAssetManager.motorcyclePic,
                      containerColor: ColorManager.yellow,
                      firstText: 'Ride',
                      firstTextColor: ColorManager.grey,
                      secondText: 'دراجة نارية\nتتسع لراكب واحد بشكل مريح\n\n',
                      onTap: () {}),
                  ChooseServiceCard(
                      svgPictureName: ImageAssetManager.rideCarPic,
                      containerColor: ColorManager.yellow,
                      firstText: 'Ride',
                      firstTextColor: ColorManager.grey,
                      secondText:
                          'اعرض السعر المناسب لك\nو اختر الشريك السائق بنفسك\nبأقل سعر وفي امان وراحة\n',
                      onTap: () {}),
                  ChooseServiceCard(
                      svgPictureName: ImageAssetManager.rideCarPic,
                      containerColor: ColorManager.grey,
                      firstText: 'سفر',
                      firstTextColor: ColorManager.yellow,
                      secondText:
                          'التنقل بين المدن\nاعرض السعر المناسب لك\nو اختر الشريك السائق بنفسك\nبأقل سعر وفي امان وراحة\n',
                      onTap: () {}),
                  ChooseServiceCard(
                      svgPictureName: ImageAssetManager.rideCarPic,
                      containerColor: ColorManager.grey,
                      firstText: 'على مودك',
                      firstTextColor: ColorManager.yellow,
                      secondText:
                          'اختر الشريك السائق واذهب\nلأي مكان في أي وقت على مودك\nفي أماكن للتنزه او للتسوق\nاكثر راحة و اكثر امان\nلمدة ساعة او اكثر',
                      onTap: () {}),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: screenHeight * 47 / 932,
                width: screenWidth * 307 / 430,
                child: CustomElevatedButton(
                  text: 'التالي',
                  onPressed: () {},
                  textColor: ColorManager.yellow,
                  buttonColor: ColorManager.grey,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: CustomTextArial(
                    text: 'التبديل الى وضع السائق',
                    fontSize: 28,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
