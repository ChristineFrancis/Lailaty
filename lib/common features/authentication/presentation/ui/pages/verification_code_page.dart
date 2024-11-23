import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_center_hint.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/verification_code_page.dart/countdown_timer.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class VerificationCodePage extends StatelessWidget {
  final TextEditingController _verificatoinCodeController =
      TextEditingController();
      
  final _formKey = GlobalKey<FormState>();

  VerificationCodePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.grey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              LailatyArabicAndEnglish(),
              const SizedBox(height: 40),
              CustomTextWidget(text: 'تفقد بريدك الإلكتروني', fontSize: 28),
              const SizedBox(height: 30),
              CustomTextWidget(
                  text: 'ارسلنا رمز تحقق الى بريدك الإلكتروني', fontSize: 22),
              const SizedBox(height: 70),
              CustomTextFormFieldCenterHint(
                  controller: _verificatoinCodeController,
                  hintText: '5  5  5  5  5  5'),
              const SizedBox(height: 30),
              const CountdownTimer(),
              const Spacer(),
              CustomElevatedButton(text: "تحقق", onPressed: () {}),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
