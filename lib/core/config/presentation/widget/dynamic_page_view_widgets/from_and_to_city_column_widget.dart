import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';

class FromAndToCityColumnWidget extends StatelessWidget {
  const FromAndToCityColumnWidget({
    super.key,
    required this.clientTripDetailsModel,
  });

  final ClientTripDetailsModel clientTripDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CityRow(
          city: clientTripDetailsModel.city1,
          letter: StringManager.aLetter,
          backGroundColor: ColorManager.blueCircleColor,
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
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
    );
  }
}
