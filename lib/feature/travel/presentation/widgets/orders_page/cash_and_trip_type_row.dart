import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';

class CashAndTripTypeRow extends StatelessWidget {
  const CashAndTripTypeRow({
    super.key,
    required this.clientTripDetailsModel,
  });

  final ClientTripDetailsModel clientTripDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorManager.whiteColor,
          ),
          child: Center(
            child: Text(
              clientTripDetailsModel.cashType,
              style: StyleManager.boldTextStyle24(
                size: context.screenWidth * 0.04,
              ),
            ),
          ),
        ),
        SizedBox(width: context.screenWidth * 0.02),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ColorManager.yellowAccent,
          ),
          child: Center(
            child: Text(
              clientTripDetailsModel.tripType,
              style: StyleManager.boldTextStyle24(
                size: context.screenWidth * 0.04,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
