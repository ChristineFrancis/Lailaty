import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/about_app_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_appbar.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'الإعدادات'),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _text('قم بتقييم التطبيق', () {}),
            _divider(),
            _text('نبذة عن التطبيق', () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AboutAppPage()));
            }),
            _divider(),
            _text('تسجيل الخروج', () {}),
            _divider(),
            InkWell(
                onTap: () {},
                child: CustomTextWidget(
                    text: 'حذف الحساب', fontSize: 34, color: Colors.red)),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          height: 1,
          color: Colors.black,
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _text(String text, VoidCallback ontap) {
    return InkWell(
        onTap: ontap,
        child: CustomTextWidget(text: text, fontSize: 34, color: Colors.black));
  }
}
