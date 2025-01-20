import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/cash_and_trip_type_row.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/letter_circle.dart';

class BottomSheetContainer extends StatelessWidget {
  final String firstBottonText;
  final String secondBottonText;
  final String thirdBottonText;
  final Color secondBottonColor;
  final Color thirdBottonColor;
  final ClientTripDetailsModel clientTripDetailsModel;
  final bool isTravelPage;
  const BottomSheetContainer({
    super.key,
    required this.clientTripDetailsModel,
    required this.firstBottonText,
    required this.secondBottonText,
    required this.thirdBottonText,
    required this.secondBottonColor,
    required this.thirdBottonColor,
    required this.isTravelPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: context.screenHeight * 0.6,
      width: context.screenWidth,
      decoration: const BoxDecoration(
          color: ColorManager.grey1,
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              clientTripDetailsModel.title,
              style: StyleManager.boldTextStyle24(),
            ),
            //!!  changed :
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            CashAndTripTypeRow(
              isTravelPage: isTravelPage,
              clientTripDetailsModel: clientTripDetailsModel,
            ),
            //!!
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Text(
              clientTripDetailsModel.dateTime,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    CityRow(
                      city: clientTripDetailsModel.city1,
                      letter: StringManager.aLetter,
                      backGroundColor: ColorManager.blueCircleColor,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.05,
                    ),
                    CityRow(
                      city: clientTripDetailsModel.city2,
                      letter: StringManager.bLetter,
                      backGroundColor: ColorManager.brightGreen,
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    Text(
                      clientTripDetailsModel.elapsedTimeExample,
                    )
                  ],
                ),
                SizedBox(
                  width: context.screenWidth * 0.04,
                ),
                Column(
                  children: [
                    LetterCircle(
                      radius: context.screenWidth * 0.06,
                      backGroundColor: ColorManager.yellowTextColor,
                      letter: '',
                    ),
                    Text(
                      clientTripDetailsModel.captainName,
                      style: StyleManager.semiboldTextStyle20(),
                    ),
                    Row(
                      children: [
                        Text(
                          '5', //! this from where ?
                          style: StyleManager.semiboldTextStyle20(),
                        ),
                        SizedBox(
                          width: context.screenWidth * 0.01,
                        ),
                        const Icon(
                          Icons.star_border,
                          color: ColorManager.yellowTextColor,
                          size: 15,
                        ),
                      ],
                    ),
                    const Text(
                      '(40)', //! what this data means ?
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Center(
              child: MyButtonWidget(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                colors: ColorManager.yellowTextColor,
                widget: Center(
                  child: Text(
                    firstBottonText,
                    style: StyleManager.boldTextStyle24(
                        size: context.screenHeight * 0.03),
                  ),
                ),
                onpress: () {},
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Center(
              child: MyButtonWidget(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                colors: secondBottonColor,
                widget: Center(
                  child: Text(
                    secondBottonText,
                    style: StyleManager.boldTextStyle24(
                      size: context.screenHeight * 0.03,
                    ),
                  ),
                ),
                onpress: () {},
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Center(
              child: MyButtonWidget(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                colors: thirdBottonColor,
                widget: Center(
                  child: Text(
                    thirdBottonText,
                    style: StyleManager.boldTextStyle24(
                        size: context.screenHeight * 0.03),
                  ),
                ),
                onpress: () {},
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
