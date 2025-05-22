import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key, this.title, required this.ispop, this.leading});

  final bool ispop; //! we can remove this :)
  final String? title;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        backgroundColor: ColorManager.greyWithOpacity,
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
        // leading: leading,
        automaticallyImplyLeading: false,
        //! the (null) don't really give the needed effect , we can use this line ( ^ )if we don't need the back arrow to appear
        //! or when navigate to tha page , use pushReplacement

        leading: ispop == true
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    //  Navigator.of(context).pop();
                    context.pop();
                  },
                  color: ColorManager.black,
                  icon: Icon(Icons.arrow_back),
                ),
              )
            : null,
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
