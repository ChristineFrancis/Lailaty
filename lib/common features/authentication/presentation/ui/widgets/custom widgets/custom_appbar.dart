import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: ColorManager.darkGrey,
      elevation: 4,
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: screenHeight * 0.1,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.arrow_forward,
            color: ColorManager.yellow,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8),
        ),
      ),
      title: CustomTextWidget(
          text: title, fontSize: 27, color: ColorManager.yellow),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);
  //TODO: make the heigth of app bar better if you can
}
