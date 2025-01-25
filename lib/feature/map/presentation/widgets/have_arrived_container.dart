import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/map/presentation/widgets/journy_details_row.dart';

class HaveArrivedContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String containerName;
  const HaveArrivedContainer({
    super.key,
    required this.onTap,
    required this.containerName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.3,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            const JournyDetailsRow(),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                width: context.screenWidth * 0.8,
                height: context.screenHeight * 0.05,
                decoration: BoxDecoration(
                  color: ColorManager.yellowTextColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    containerName,
                    style: StyleManager.boldTextStyle24(
                      size: context.screenHeight * 0.02,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
