import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/horizontal_price_list.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class YourOfferWasNotAcceptedContainer extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback whenChoosing;
  const YourOfferWasNotAcceptedContainer(
      {super.key, required this.onClose, required this.whenChoosing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.25,
      width: context.screenWidth,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  width: context.screenWidth * 0.08,
                  height: context.screenWidth * 0.08,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.yellowTextColor,
                  ),
                  child: Icon(
                    Icons.close,
                    size: context.screenWidth * 0.05,
                    color: ColorManager.grey1,
                  ),
                ),
              ),
            ),
            Text(
              StringManager.payExample + StringManager.yourOfferWasNotAccepted,
              style: StyleManager.boldTextStyle24(
                size: context.screenWidth * 0.05,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Text(
              StringManager.offerLessFare,
              style: StyleManager.normalText18(
                color: ColorManager.black,
                size: context.screenWidth * 0.04,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            HorizontalPriceList()
          ],
        ),
      ),
    );
  }
}
