import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/old_splash/widgets/custom_text_widget.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        title: 'نبذة عن التطبيق',
        ispop: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => RulesPage()));
                  context.push(AppKeys.rulesPageKey);
                },
                child: CustomTextWidget(
                    text: 'قواعد الخدمة', fontSize: 34, color: Colors.black)),
            SizedBox(height: 20),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(height: 15),
            CustomTextWidget(
                text: 'إصدار التطبيق', fontSize: 34, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextWidget(
                    text: '1.0.0', fontSize: 24, color: Colors.black),
                SizedBox(width: 15)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
