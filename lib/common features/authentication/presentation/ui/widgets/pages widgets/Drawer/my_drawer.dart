import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/inbox_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/order_history_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/safity_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/setting_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_arial.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/Drawer/my_bottom_sheet.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double photoWidth = screenWidth * 0.13;
    return Drawer(
      backgroundColor: ColorManager.grey,
      width: screenWidth * 0.62,
      child: Container(
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 9),
        child: Column(
          children: [
            //! ||||||||||||||||||
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.keyboard_arrow_left_rounded)),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                  text: 'محمد',
                                  fontSize: 25,
                                  color: Colors.black),
                              CustomTextWidget(
                                  text: '*****',
                                  fontSize: 14,
                                  color: ColorManager.yellow),
                            ],
                          ),
                          SizedBox(width: 7),
                          Container(
                            width: photoWidth,
                            height: photoWidth,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(photoWidth),
                              child: Container(
                                color: ColorManager.yellow,
                              ),
                              //child: Image.asset('name', fit: BoxFit.cover,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.yellow,
                        borderRadius: BorderRadius.circular(5)),
                    height: 1.5,
                    width: screenWidth * 0.55,
                  ),
                ]),

            SizedBox(height: screenHeight * 0.03),
            SingleChildScrollView(
              child: Column(
                children: [
                  _myTile(context, 'داخل المدينة',
                      Icons.directions_car_filled_outlined, () {}),
                  _carOrMotor(context, () {}, () {}),
                  _myTile(context, 'سفر', Icons.directions_car_filled_outlined,
                      () {}),
                  _myTile(context, 'زفاف-رجال اعمال',
                      Icons.directions_car_filled_outlined, () {}),
                  _myTile(context, 'على مودك',
                      Icons.directions_car_filled_outlined, () {}),
                  _myTile(context, 'تعليم القيادة',
                      Icons.directions_car_filled_outlined, () {}),
                  _myTile(context, 'سجل الطلبات', Icons.history, () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrderHistoryPage()));
                  }),
                  _myTile(context, 'السلامة', Icons.verified_user_outlined, () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SafityPage()));
                  }),
                  _myTile(context, 'الصندوق الوارد', Icons.mail_outline_rounded,
                      () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => InboxPage()));
                  }),
                  _myTile(context, 'الإعدادات', Icons.settings_outlined, () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SettingPage()));
                  }),
                  _myTile(
                      context, 'مشاركة التطبيق', Icons.share_outlined, () {}),
                  _myTile(context, 'اتصل بنا', Icons.support_agent, () {}),
                  SizedBox(height: screenHeight * 0.1),
                  _captianMood(context),
                  // TODO: put insta and facebook logo
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//! my widgets

Widget _myTile(
    BuildContext context, String text, IconData icon, VoidCallback onpressed) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: onpressed,
    child: SizedBox(
      height: screenHeight * 0.047,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomTextWidget(text: text, fontSize: 20, color: Colors.black),
          SizedBox(width: 10),
          Icon(
            icon,
            size: screenWidth * 0.08,
            color: ColorManager.yellow,
          ),
        ],
      ),
    ),
  );
}

Widget _carOrMotor(BuildContext context, VoidCallback onpressedCar,
    VoidCallback onpressedMotor) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      InkWell(
        onTap: onpressedCar,
        child: SizedBox(
          height: screenHeight * 0.047,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextWidget(
                  text: 'سيارة', fontSize: 20, color: Colors.black),
              SizedBox(width: 10 + screenWidth * 0.08),
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 1.5,
            width: screenWidth * 0.27,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(width: screenWidth * 0.08),
        ],
      ),
      InkWell(
        onTap: onpressedMotor,
        child: SizedBox(
          height: screenHeight * 0.047,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomTextWidget(
                  text: 'دراجة نارية', fontSize: 20, color: Colors.black),
              SizedBox(width: 10 + screenWidth * 0.08),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _captianMood(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return InkWell(
    onTap: () {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent, // Makes the background transparent
        builder: (BuildContext context) {
          return MyBottomSheet();
        },
      );
    },
    child: Container(
      width: screenWidth * 0.5,
      height: screenHeight * 0.06,
      decoration: BoxDecoration(
          color: ColorManager.yellow, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: CustomTextArial(
            text: 'وضع الشريك السائق', fontSize: 25, color: Colors.black),
      ),
    ),
  );
}
