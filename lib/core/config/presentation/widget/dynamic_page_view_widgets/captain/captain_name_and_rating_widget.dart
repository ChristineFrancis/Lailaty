import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/captain/captain_image.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';

class CaptainNameAndRating extends StatelessWidget {
  const CaptainNameAndRating({
    super.key,
    this.clientTripDetailsModel, //! change this to required <<
  });

  final ClientTripDetailsModel? clientTripDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CaptainImage(),
          Text(
            clientTripDetailsModel != null
                ? clientTripDetailsModel!.captainName
                : StringManager.exampleCaptainName,
            style: StyleManager.semiboldTextStyle20(),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '5',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: context.screenWidth * 0.035,
                ),
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
          Text(
            '(40)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.screenWidth * 0.035,
            ),
          ),
        ],
      ),
    );
  }
}
