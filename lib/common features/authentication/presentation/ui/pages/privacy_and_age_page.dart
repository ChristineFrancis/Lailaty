import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/choose_city_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/login_word.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/privacy_and_age_page/custom_check_box.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class PrivacyAndAgePage extends StatelessWidget {
  bool statusAge=false;
  bool statusprivacy=false;
   PrivacyAndAgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width/45, ),
        child: Column(
          children: [
           Spacer(flex: 3,),
            LoginWord(),
            Spacer(flex: 3,),
            LayoutBuilder(
              builder: (context, constraints) {
                final imageHeight = constraints.maxWidth / 2.3;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LailatyArabicAndEnglish(),
                    SizedBox(width: 6,),
                    Container(
                      width: 3, // Width of the yellow line
                      height: imageHeight, // Match the height of the image
                      color: ColorManager.yellow,
                    ),
                    SvgPicture.asset(
                      ImageAssetManager.privacyLock,
                      width: imageHeight, // Set the width of the image
                    ),
                  ],
                );
              },
            ),
            Spacer(flex: 6,),
            
        CustomCheckBox(
  status: statusprivacy,
  textwidget: RichText(
    textAlign: TextAlign.right, // Ensure text aligns properly in RTL
    text: TextSpan(
      text: 'عمري 18 او اكثر و أوافق على شروط الخصوصية والاستخدام ',
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      children: [
        TextSpan(
          text: 'الخاصة بتطبيق ليلتي',
          style: TextStyle(
            fontSize: 18,
            color: ColorManager.yellow,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  ),
),

        Spacer(flex: 2,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width/7, ),
          child: CustomButton(textButton: 'التالي', 
          onTap: () {
            Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => ChooseCityPage(),));
          },),
        ),
        Spacer(flex: 2,),
        
        
            
          ],
        ),
      ),
    );
  }
}
