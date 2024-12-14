import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/rules_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_appbar.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'نبذة عن التطبيق'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RulesPage()));
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
