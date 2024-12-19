import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key, this.title, required this.ispop});

  final bool ispop;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorManager.semiBoldyellow,
        centerTitle: true,
        title: title != null
            ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '$title',
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black),
                ),
              )
            : null,
        leading: ispop == true
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: ColorManager.black,
                  icon: Icon(Icons.arrow_back),
                ),
              )
            : null);
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
