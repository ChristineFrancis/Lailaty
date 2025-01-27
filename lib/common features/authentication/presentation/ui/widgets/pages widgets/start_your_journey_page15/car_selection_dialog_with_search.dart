import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_search_delegate.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/start_your_journey_page15/choose_car_card.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/start_your_journey_page15/search_with_text_form_field.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CarSelectionDialogWithSearch extends StatelessWidget {
  const CarSelectionDialogWithSearch({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
      backgroundColor: ColorManager.grey200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.only(
          left: 12, right: 12, top: 12, bottom: screenHeight * 0.08),
      title: Expanded(
        child: Container(
          height: screenHeight * 0.04,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: CustomTextWidget(
              text: 'اختر الفئة السعرية المناسبة لرحلتك',
              fontSize: 20,
              color: Colors.black),
        ),
      ),
      content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: screenHeight * 0.18,
                  ),
                  children: [
                    ChooseCarCard(
                      svgPictureName: ImageAssetManager.suvCarPic,
                      title: 'SUV سيارة',
                      description: 'الحد الأدنى لمشوار الزفة-رجال أعمال',
                      price: '1400',
                      onpressed: () {},
                    ),
                    ChooseCarCard(
                      svgPictureName: ImageAssetManager.sidanCarPic,
                      title: 'سيارة سيدان متوسطة او كبيرة',
                      description: 'الحد الأدنى لمشوار الزفة-رجال أعمال',
                      price: '900',
                      onpressed: () {},
                    ),
                    ChooseCarCard(
                      svgPictureName: ImageAssetManager.limozinCarPic,
                      title: 'سيارة ليموزين',
                      description: 'الحد الأدنى لمشوار الزفة-رجال أعمال',
                      price: '4100',
                      onpressed: () {},
                    ),
                    ChooseCarCard(
                      svgPictureName: ImageAssetManager.vipCarPic,
                      title: 'VIP CATEGORY',
                      description: 'الحد الأدنى لمشوار الزفة-رجال أعمال',
                      price: '2600',
                      onpressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ChooseCarCard(
                  svgPictureName: ImageAssetManager.luxuryCarPic,
                  title: 'LUXURY CAR',
                  description: 'الحد الأدنى لمشوار الزفة-رجال أعمال',
                  price: '7200',
                  onpressed: () {},
                ),
                SizedBox(height: 10),
                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: screenHeight * 0.18,
                  ),
                  children: [
                    ChooseCarCard(
                      svgPictureName: ImageAssetManager.vipCaporlehCarPic,
                      title: 'VIP كابورليه',
                      description: 'الحد الأدنى لمشوار الزفة-رجال أعمال',
                      price: '2600',
                      onpressed: () {},
                    ),
                    ChooseCarCard(
                      svgPictureName: ImageAssetManager.caporlehCarPic,
                      title: 'كابورليه',
                      description: 'الحد الأدنى لمشوار الزفة-رجال أعمال',
                      price: '1300',
                      onpressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _filterCars(context),
                SizedBox(height: 10),
                SearchWithTextFormField(
                  items: ["Toyota", "Mercedes", "BMW", "Nisan"],
                  hintText: "ادخل نوع السيارة التي تريدها...",
                  onItemSelected: (value) {
                    print("Selected: $value");
                  },
                ),
              ],
            ),
          )),
    );
  }
}

//!my widgets

Widget _filterCars(BuildContext context) {
  return InkWell(
      onTap: () {
        showSearch(context: context, delegate: CustomSearchDelegate());
      },
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.4),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.grey,
          ),
          child: CustomTextWidget(
              text: 'إمكانية فلترة الفئات لنوع سيارة معين',
              fontSize: 16,
              color: ColorManager.yellow),
        ),
        // TODO: add search field
      ));
}
