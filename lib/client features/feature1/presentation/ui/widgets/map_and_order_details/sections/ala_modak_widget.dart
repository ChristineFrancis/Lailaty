import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/drop_down_list.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/core/resources/color_manager.dart';

////////////////17
class AlaModakWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final List<CarType> carsType;
  static final TextEditingController notesController = TextEditingController();
  static final TextEditingController commentsController =
      TextEditingController();
  static final TextEditingController startingLocationController =
      TextEditingController();
  AlaModakWidget(
      {super.key, required this.sizeOfGreySection, required this.carsType});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<String> moneyForTime = [
      '1 ساعة مقابل 300 EGP',
      '2 ساعة مقابل 300 EGP',
      '3 ساعة مقابل 300 EGP',
      '4 ساعة مقابل 300 EGP',
    ];

    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height / 2 - 40, bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: ColorManager.grey,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          //physics : NeverScrollableScrollPhysics(),
          shrinkWrap: false,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarSelection(
                  carsType: carsType,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 7,
                  ),
                  child: Column(
                    children: [
                      /*CurrentAndNextLocationWord(
                        isCurrentLocation: true,
                      ),*/
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFormFieldName(
                              hintText: 'من',
                              controller: startingLocationController,
                              hintTextColor: Colors.black,
                              fontSizeText: 20,
                              isArabic: true,
                              textAlign: TextAlign.start)),
                      SizedBox(height: sizeOfGreySection / 27),
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: DropDownList(
                            myList: moneyForTime,
                            hint: 'اختر عدد الساعات',
                            percentageOfDropdown: 0.15),
                      ),
                      SizedBox(height: sizeOfGreySection / 27),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFormFieldName(
                              hintText: 'التعليقات',
                              controller: commentsController,
                              hintTextColor: Colors.black,
                              fontSizeText: 20,
                              isArabic: true,
                              textAlign: TextAlign.start)),
                      SizedBox(height: sizeOfGreySection / 25),
                    ],
                  ),
                ),
                PayAndySearchDriverAndChoices(
                  notesController: notesController,
                ),
                SizedBox(height: sizeOfGreySection / 28),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
