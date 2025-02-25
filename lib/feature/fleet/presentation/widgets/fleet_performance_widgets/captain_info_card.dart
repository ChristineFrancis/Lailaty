import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/imageProduct.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CaptainInfoCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String carType;
  final double progress;
  final double rating;

  const CaptainInfoCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.carType,
    required this.progress,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          rating.toString(),
                          style: StyleManager.smallBlackText16(
                            size: context.screenWidth * 0.04,
                            color: ColorManager.grey1,
                          ),
                        ),
                        Icon(
                          Icons.star_border,
                          color: ColorManager.grey1,
                          size: context.screenWidth * 0.04,
                        ),
                      ],
                    ),
                    Text(
                      name,
                      style: StyleManager.normalText18(
                        color: ColorManager.black,
                        size: context.screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
                Text(
                  carType,
                  style: StyleManager.miniSmallText14(
                    color: ColorManager.grey1,
                    size: context.screenWidth * 0.035,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.01),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: ColorManager.backGroundColor,
                      color: ColorManager.yellowTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: context.screenWidth * 0.02),
          ImageProduct(
            image: imageUrl,
          ),
        ],
      ),
    );
  }
}
