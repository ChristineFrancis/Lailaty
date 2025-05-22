import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/state_managments/birthdate_view_model.dart';
import 'package:provider/provider.dart';

//! will be a 11/12/200 and 8:00? or just date ?
class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final birthDateViewModel = context.watch<DateviewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () =>
              birthDateViewModel.pickDate(context, allowFutureDates: true),
          child: Text(
            birthDateViewModel.selectedDate == null
                ? StringManager.when
                : birthDateViewModel.formattedDate,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenWidth * 0.05,
            ),
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.03,
        ),
        const Icon(
          Icons.date_range,
          color: ColorManager.black,
          size: 35,
        ),
      ],
    );
  }
}
