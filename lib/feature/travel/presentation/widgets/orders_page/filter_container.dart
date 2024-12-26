import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/city_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/custom_divider.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/date_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/notify_new_orders_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/paths_row.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: context.screenWidth,
      decoration: const BoxDecoration(
        color: ColorManager.grey1,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      child: const Column(
        children: [
          CityRow(
            city: StringManager.cityAlexandria,
            backGroundColor: ColorManager.blueCircleColor,
            letter: StringManager.aLetter,
          ),
          CustomDivider(),
          PathsRow(),
          CustomDivider(),
          DateRow(),
          CustomDivider(),
          NotifyNewOrdersRow()
        ],
      ),
    );
  }
}
