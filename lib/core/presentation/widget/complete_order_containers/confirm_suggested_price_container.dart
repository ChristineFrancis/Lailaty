// trip = ride
//luxury without suggestions
import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/horizontal_price_list.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/captain/captain_name_and_rating_widget.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/from_and_to_city_column_widget.dart';
import 'package:lailaty/core/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class ConfirmSuggestedPriceContainer extends StatelessWidget {
  final VoidCallback toThePrivousPage;
  final VoidCallback onAccepted;
  final VoidCallback? toSuggestYourFare;
  final bool priceOptions;
  const ConfirmSuggestedPriceContainer({
    super.key,
    required this.onAccepted,
    required this.toThePrivousPage,
    required this.priceOptions,
    this.toSuggestYourFare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.55,
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
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.1),
              child: Text(
                StringManager.meterExample + StringManager.meter,
                style: StyleManager.normalText18(
                  size: context.screenWidth * 0.05,
                  color: ColorManager.whiteColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.1),
              child: Text(
                StringManager.examplePrice,
                style: StyleManager.semiboldTextStyle20(
                  color: ColorManager.black,
                  size: context.screenWidth * 0.06,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FromAndToCityColumnWidget(
                  city1: StringManager.alexandriaStreetExample,
                  city2: StringManager.alexandriaStreetExample,
                ),
                CaptainNameAndRating(),
              ],
            ),
            const Divider(
              color: ColorManager.yellowTextColor,
              thickness: 1.5,
            ),
            SizedBox(
              height: context.screenWidth * 0.04,
            ),
            Center(
              child: MyButtonWidget(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                colors: ColorManager.yellowTextColor,
                widget: Center(
                  child: Text(
                    '${StringManager.examplePrice} ${StringManager.acceptancefor}',
                    style: StyleManager.boldTextStyle24(
                      size: context.screenHeight * 0.03,
                    ),
                  ),
                ),
                onpress: onAccepted,
              ),
            ),
            SizedBox(
              height: context.screenWidth * 0.02,
            ),
            priceOptions
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: toSuggestYourFare,
                        icon: const Icon(Icons.mode_edit_outline),
                        color: ColorManager.whiteColor,
                      ),
                      Text(
                        StringManager.suggestYourFare,
                        style: StyleManager.boldTextStyle24(
                          color: ColorManager.whiteColor,
                          size: context.screenWidth * 0.06,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
            priceOptions
                ? SizedBox(height: context.screenWidth * 0.02)
                : const SizedBox.shrink(),
            priceOptions
                ? HorizontalPriceList(
                    onTap: onAccepted,
                  )
                : const SizedBox.shrink(),
            SizedBox(
              height: context.screenWidth * 0.02,
            ),
            Center(
              child: InkWell(
                onTap: toThePrivousPage,
                child: Text(
                  StringManager.skip,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenHeight * 0.03,
                    color: ColorManager.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
