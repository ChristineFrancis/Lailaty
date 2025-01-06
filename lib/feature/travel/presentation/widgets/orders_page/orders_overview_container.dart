import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class OrdersOverviewContainer extends StatelessWidget {
  final void Function()? onTap;
  final bool isFilterVisible;
  const OrdersOverviewContainer({
    super.key,
    this.onTap,
    required this.isFilterVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.only(
        top: context.screenHeight * 0.01,
        bottom: context.screenHeight * 0.01,
      ),
      width: context.screenWidth,
      height: context.screenHeight * 0.07,
      color: ColorManager.yellowTextColor,
      //? : change this into back data
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: context.screenHeight * 0.05,
              height: context.screenHeight * 0.05,
              decoration: BoxDecoration(
                color: ColorManager.boldgrey,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: ColorManager.grey1, offset: Offset(-2, 1))
                ],
              ),
              child: Center(
                child: Icon(
                  isFilterVisible ? Icons.close : Icons.search,
                  color: ColorManager.yellowTextColor,
                ),
              ),
            ),
          ),
          const Spacer(),
          Text(
            StringManager.ordersOverview,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenHeight * 0.025,
            ),
          ),
        ],
      ),
    );
  }
}
