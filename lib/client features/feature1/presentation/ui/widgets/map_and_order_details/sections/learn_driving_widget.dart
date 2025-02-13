import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/drop_down_list.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

////////////////17
// ignore: must_be_immutable
class LearnDrivingWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final List<CarType> carsType;
  final int selectedIndex;
  final Function(int) onCarSelected;

  //!-----------------------------------------------------------
  final TextEditingController notesController = TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController numberOfDaysController = TextEditingController();
  //!-----------------------------------------------------------

  bool showPrice = true;
  LearnDrivingWidget({
    super.key,
    required this.sizeOfGreySection,
    required this.carsType,
    required this.selectedIndex,
    required this.onCarSelected,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          top: showPrice
              ? MediaQuery.sizeOf(context).height * 0.24
              : MediaQuery.sizeOf(context).height * 0.3,
          bottom: 0),
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
                  selectedIndex: selectedIndex,
                  onCarSelected: onCarSelected,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 7,
                  ),
                  child: Column(
                    children: [
                      CurrentAndNextLocationWord(
                        isCurrentLocation: true,
                      ),
                      SizedBox(height: sizeOfGreySection / 27),
                      SizedBox(
                        width: screenWidth * 315 / 430,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                                text: 'مدة الكورس',
                                fontSize: 18,
                                color: Colors.black),
                            SizedBox(
                              width: screenWidth * 159 / 430,
                              // height:MediaQuery.of(context).size.height * 50 / 932,

                              child: DropDownList(
                                  myList: ['ساعة', 'ساعة و نصف'],
                                  hint: 'ساعة',
                                  percentageOfDropdown: 0.1),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: sizeOfGreySection / 27),
                      SizedBox(
                        width: screenWidth * 315 / 430,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextWidget(
                                text: 'نوع غيار السيارة',
                                fontSize: 18,
                                color: Colors.black),
                            SizedBox(
                              width: screenWidth * 159 / 430,
                              child: DropDownList(
                                  myList: ['اتوماتيك', 'مانويل'],
                                  hint: 'اتوماتيك',
                                  percentageOfDropdown: 0.1),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: sizeOfGreySection / 27),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: CustomTextFormFieldName(
                              hintText: 'عدد الأيام',
                              controller: numberOfDaysController,
                              hintTextColor: Colors.black,
                              fontSizeText: 20,
                              isArabic: true,
                              textAlign: TextAlign.start)),
                      SizedBox(height: sizeOfGreySection / 27),
                      showPrice
                          ? CustomTextWidget(
                              text: 'سعر الرحلة 90 EGP',
                              fontSize: 26,
                              color: Colors.black)
                          : SizedBox(),
                      showPrice
                          ? SizedBox(height: sizeOfGreySection / 27)
                          : SizedBox(),
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
