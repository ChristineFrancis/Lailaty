import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/user_info_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_center_hint.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/verification_code_page.dart/countdown_timer.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class VerificationCodePage extends StatelessWidget {
  final TextEditingController _verificatoinCodeController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  VerificationCodePage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
        //resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.grey,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LailatyArabicAndEnglish(),
                SizedBox(height: screenHeight * 0.036),
                CustomTextWidget(
                    text: 'تفقد بريدك الإلكتروني',
                    fontSize: 28,
                    color: Colors.black),
                SizedBox(height: screenHeight * 0.041),
                CustomTextWidget(
                    text: 'ارسلنا رمز تحقق الى بريدك الإلكتروني',
                    fontSize: 22,
                    color: Colors.black),
                SizedBox(height: screenHeight * 0.06),
                CustomTextFormFieldCenterHint(
                    controller: _verificatoinCodeController,
                    hintText: '5  5  5  5  5  5'),
                SizedBox(height: screenHeight * 0.036),
                const CountdownTimer(),
                SizedBox(height: screenHeight * 0.212),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width / 9,
                  ),
                  child: CustomButton(
                    textButton: 'تحقق',
                    textSize: 19,
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => UserInfoPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
