import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class FromAndToCityColumnWidget extends StatelessWidget {
  const FromAndToCityColumnWidget({
    super.key,
    required this.city1,
    required this.city2,
    //  this.archivedorder = false,
  });
  final String city1;
  final String city2;
//  final bool archivedorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CityRow(
          city: city1,
          letter: StringManager.aLetter,
          backGroundColor: ColorManager.blueCircleColor,
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        CityRow(
          city: city2,
          letter: StringManager.bLetter,
          backGroundColor: ColorManager.brightGreen,
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        // archivedorder
        //     ? const SizedBox.shrink()
        //     : Text(
        //         clientTripDetailsModel.elapsedTimeExample,
        //       )
      ],
    );
  }
}
