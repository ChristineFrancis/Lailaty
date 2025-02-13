import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/suggest_your_price_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/core/resources/color_manager.dart';

////////////////17
class LuxuryWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final List<CarType> carsType;
  final int selectedIndex;
  final Function(int) onCarSelected;
  //!===============================================
  final TextEditingController priceController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController destinationLocationController =
      TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  //!===============================================
  LuxuryWidget(
      {super.key,
      required this.sizeOfGreySection,
      required this.carsType,
      required this.selectedIndex,
      required this.onCarSelected});

  @override
  Widget build(BuildContext context) {
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
                      CustomTextFormFieldName(
                          hintText: 'الى',
                          controller: destinationLocationController,
                          hintTextColor: Colors.black,
                          isArabic: true,
                          textAlign: TextAlign.start),
                      SizedBox(height: sizeOfGreySection / 27),
                      InkWell(
                          onTap: () async {
                            await suggestYourPriceBottomSheet(
                                context, priceController);
                          },
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
