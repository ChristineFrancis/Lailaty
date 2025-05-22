import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class HorizontalPriceList extends StatelessWidget {
  HorizontalPriceList({super.key, required this.onTap});
  final List<String> prices = ["95 EGP", "90 EGP", "85 EGP"];
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.screenHeight * 0.06,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: prices.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                  color: ColorManager.yellowTextColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  prices[index],
                  style: StyleManager.boldTextStyle24(
                    size: context.screenWidth * 0.04,
                    color: ColorManager.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
