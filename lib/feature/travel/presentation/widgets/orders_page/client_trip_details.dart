import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/cash_and_trip_type_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/city_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/custom_divider.dart';

class ClientTripDetailsContainer extends StatelessWidget {
  final ClientTripDetailsModel clientTripDetailsModel;
  // final String title;
  // final String cashType;
  // final String tripType;
  // final String dateTime;
  // final String city1;
  // final String city2;
  // final String captainName;
  final VoidCallback onTap;
  const ClientTripDetailsContainer({
    super.key,
    // required this.title,
    // required this.cashType,
    // required this.tripType,
    // required this.dateTime,
    // required this.city1,
    // required this.city2,
    // required this.captainName,
    required this.onTap,
    required this.clientTripDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorManager.grey1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              clientTripDetailsModel.title,
              style: StyleManager.boldTextStyle24(
                size: context.screenWidth * 0.05,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.02),
              child: CashAndTripTypeRow(
                clientTripDetailsModel: clientTripDetailsModel,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              clientTripDetailsModel.dateTime,
              style: StyleManager.semiboldTextStyle20(
                size: context.screenWidth * 0.035,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            CityRow(
              city: clientTripDetailsModel.city1,
              letter: StringManager.aLetter,
              backGroundColor: ColorManager.blueCircleColor,
            ),
            SizedBox(height: context.screenHeight * 0.01),
            CityRow(
              city: clientTripDetailsModel.city2,
              letter: StringManager.bLetter,
              backGroundColor: ColorManager.brightGreen,
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.02),
              child: Text(
                clientTripDetailsModel.elapsedTimeExample,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const CustomDivider(),
            CityRow(
              city: clientTripDetailsModel.captainName,
              letter: '',
              radius: context.screenWidth * 0.055,
              backGroundColor: ColorManager.yellowTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
