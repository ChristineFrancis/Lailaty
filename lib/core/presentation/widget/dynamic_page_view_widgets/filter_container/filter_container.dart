import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/custom_divider.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/filter_container/date_row.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/filter_container/notify_new_orders_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/paths_row.dart';

class FilterContainer extends StatelessWidget {
  final bool isTravelPage;
  const FilterContainer({
    super.key,
    required this.isTravelPage,
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
      child: Column(
        children: [
          const CityRow(
            city: StringManager.cityAlexandria,
            backGroundColor: ColorManager.blueCircleColor,
            letter: StringManager.aLetter,
          ),
          const CustomDivider(),
          PathsRow(
            isTravelPage: isTravelPage,
          ),
          CustomDivider(
            isNotShrink: isTravelPage,
          ),
          const DateRow(),
          const CustomDivider(),
          const NotifyNewOrdersRow()
        ],
      ),
    );
  }
}
