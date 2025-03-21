import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/choose_city_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/login_word.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import '../../../../../core/ui/alerts/problem_dialog.dart';
import '../widgets/custom widgets/check_box/custom_check_box.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool statusPrivacy = false; // state for the checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 45,
        ),
        child: Column(
          children: [
            const Spacer(flex: 3),
            LoginWord(),
            const Spacer(flex: 3),
            LayoutBuilder(
              builder: (context, constraints) {
                final imageHeight = constraints.maxWidth / 2.3;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LailatyArabicAndEnglish(),
                    const SizedBox(width: 6),
                    Container(
                      width: 3,
                      height: imageHeight,
                      color: ColorManager.yellow,
                    ),
                    SvgPicture.asset(
                      ImageAssetManager.privacyLock,
                      width: imageHeight,
                    ),
                  ],
                );
              },
            ),
            const Spacer(flex: 6),
            CustomCheckBox(
              status: statusPrivacy,
              onChanged: (bool? value) {
                setState(() {
                  statusPrivacy = value ?? false;
                });
              },
              textwidget: RichText(
                textAlign: TextAlign.right, // Ensure proper RTL alignment
                text: TextSpan(
                  text: 'أوافق على  ',
                  style: TextStyle(
                    fontSize: getResponsiveText(18, context),
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: 'شروط الخصوصية و الاستخدام ',
                      style: TextStyle(
                        fontSize: getResponsiveText(18, context),
                        color: ColorManager.yellow,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: 'الخاصة بتطبيق ليلتي',
                      style: TextStyle(
                        fontSize: getResponsiveText(18, context),
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 7,
              ),
              child: CustomButton(
                textButton: 'التالي',
                textSize: 27,
                fontWeight: FontWeight.w900,
                onTap: () {
                  if (!statusPrivacy) {
                    // If the checkbox is not checked, show the problem dialog
                    showDialog(
                      context: context,
                      builder: (context) => const ProblemDialog(
                        message: 'يجب عليك الموافقة على سياسة الخصوصية للإكمال',
                      ),
                    );
                  } else {
                    // Navigate if the checkbox is checked
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const ChooseCityPage(),
                      ),
                    );
                  }
                },
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
