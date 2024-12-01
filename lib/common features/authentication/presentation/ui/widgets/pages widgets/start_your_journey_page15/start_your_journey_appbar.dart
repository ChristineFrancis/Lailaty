import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class StartYourJourneyAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onBackPressed; // Callback for the back button action

  const StartYourJourneyAppbar({
    super.key,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: ColorManager.darkGrey,
      elevation: 4, // Adds a slight shadow
      automaticallyImplyLeading: false, // Disable default back arrow
      actions: [
        IconButton(
          icon: const Icon(
            Icons.arrow_forward,
            color: ColorManager.yellow,
          ),
          onPressed: onBackPressed ?? () => Navigator.pop(context),
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8), // Circular bottom corners
        ),
      ),
      title: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row
          children: [
            SizedBox(width: screenWidth * 0.12), // Empty space on the left
            SvgPicture.asset(
              ImageAssetManager.lailatyArabic,
              height: MediaQuery.of(context).size.height *
                  0.04, // Responsive height
            ),
            CustomTextWidget(
              text: '  ابدأ رحلتك مع ',
              fontSize: MediaQuery.of(context).size.width *
                  0.04, // Responsive font size
              color: ColorManager.yellow,
            ),
          ],
        ),
      ),

      centerTitle: true, // Ensures the title row is centered
      toolbarHeight: screenHeight * 0.1, // Responsive AppBar height
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
