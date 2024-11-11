import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/custom_button.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar(
      {super.key,
      required this.isnNotification,
      this.title,
      required this.ispop});
  final bool isnNotification;
  final bool ispop;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManager.grey1,
      centerTitle: true,
      title: title != null
          ? Text(
              '$title',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.yellow),
            )
          : null,
      actions: [
        // if (isnNotification == true)
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: CustomButton(
        //       onpress: () {},
        //       colors: AppColor.purple5,
        //       width: 37,
        //       height: 37,
        //       radius: 8,
        //       icon: Icons.notifications_outlined,
        //       colorIcon: AppColor.white,
        //     ),
        //   ),
        if (ispop == true)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomButton(
              onpress: () {
               
              },
              colors: ColorManager.yellow,
              width: 37,
              height: 37,
              radius: 8,
              icon: Icons.arrow_forward,
              colorIcon: ColorManager.yellow,
            ),
          ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
        child: CustomButton(
          onpress: () {
            Scaffold.of(context).openDrawer();
            // _scaffoldKey.currentState!.openDrawer();
          },
          colors: ColorManager.yellow,
          width: 30,
          height: 10,
          radius: 8,
          icon: Icons.list,
          colorIcon: ColorManager.yellow,
        ),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
