import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/letter_circle.dart';
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
    return Column(
      children: [
        LetterCircle(
          radius: context.screenWidth * 0.06,
          backGroundColor: ColorManager.yellowTextColor,
          letter: '',
        ),
        Text(
          clientTripDetailsModel != null
              ? clientTripDetailsModel!.captainName
              : StringManager.exampleCaptainName,
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
    );
  }
}
