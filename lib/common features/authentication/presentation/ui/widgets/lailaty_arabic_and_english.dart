import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';

class LailatyArabicAndEnglish extends StatelessWidget {
  const LailatyArabicAndEnglish({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                SvgPicture.asset(ImageAssetManager.lettersLY),
                SizedBox(width: MediaQuery.sizeOf(context).width/30,),
                SvgPicture.asset(ImageAssetManager.lailaty),
                 ],
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height/45,),
            SvgPicture.asset(ImageAssetManager.lailatyArabic),
          ],
        ),
    );
  }
}