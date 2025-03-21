import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/location_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/login_word.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.grey,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorManager.yellow,
              )),
        ),
        backgroundColor: ColorManager.grey,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width / 45,
          ),
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              LoginWord(),
              Spacer(
                flex: 3,
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  final imageHeight = constraints.maxWidth / 2.3;
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LailatyArabicAndEnglish(),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 3, // Width of the yellow line
                          height: imageHeight, // Match the height of the image
                          color: ColorManager.yellow,
                        ),
                        SvgPicture.asset(
                          ImageAssetManager.notifications,
                          width: imageHeight, // Set the width of the image
                        ),
                      ],
                    ),
                  );
                },
              ),
              Spacer(
                flex: 3,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width / 20),
                  child: CustomTextWidget(
                    text: 'هل تود السماح لتطبيق ليلتي بارسال الاشعارات',
                    color: Colors.black,
                    fontSize: 25,
                  )
                  // Text('هل تود السماح لتطبيق ليلتي بارسال الاشعارات',
                  // textAlign: TextAlign.center,
                  // style: const TextStyle( fontWeight: FontWeight.w600 , fontSize: 23,)),
                  ),
              //SizedBox(height: 20,),
              //Spacer(flex: 1,),

              //CityDropdown(),

              Spacer(
                flex: 3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 7,
                ),
                child: CustomButton(
                  textButton: 'السماح',
                  textSize: 25,
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          LocationPage(),
                    ));
                  },
                ),
              ),
              TextButton(
                child: CustomTextWidget(
                  text: 'تخطي',
                  color: ColorManager.yellow,
                  fontSize: 27,
                ),
                onPressed: () {},
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
