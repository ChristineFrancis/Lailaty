import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_appbar.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class SafityPage extends StatelessWidget {
  const SafityPage({super.key});

  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    //double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppbar(title: 'السلامة'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Icon(
              Icons.verified_user_outlined,
              size: 190,
              color: ColorManager.grey,
            ),
            SizedBox(height: 20),
            CustomTextWidget(
                text: 'بمن تريد الاتصال؟', fontSize: 35, color: Colors.black),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: CustomTextWidget(
                        text: 'الإسعاف', fontSize: 35, color: Colors.black),
                  ),
                  Divider(
                    height: 15,
                    thickness: 1.5,
                    color: Colors.black,
                  ),
                  /*SizedBox(height: 7),
                  Container(
                    height: 1.3,
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  SizedBox(height: 7),*/
                  InkWell(
                    onTap: () {},
                    child: CustomTextWidget(
                        text: 'الشرطة', fontSize: 35, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
