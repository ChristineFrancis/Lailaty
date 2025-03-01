import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/common%20features/authentication/presentation/bloc/verify_email_bloc/verify_email_bloc.dart';
import 'package:lailaty/common%20features/authentication/presentation/bloc/verify_email_bloc/verify_email_event.dart';
import 'package:lailaty/common%20features/authentication/presentation/bloc/verify_email_bloc/verify_email_state.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/finaly_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20form%20fields/custom_text_field.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import '../../../../../core/config/storage/dependency_injection.dart';
import '../widgets/pages widgets/verification_code_page/countdown_timer.dart';

class VerificationCodePage extends StatelessWidget {
  final String email;
  const VerificationCodePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorManager.grey,
          body: BlocProvider(
            create: (_) => sl<VerifyEmailBloc>(),
            child: BlocListener<VerifyEmailBloc, VerifyEmailState>(
              listener: (context, state) {
                if (state is VerifyEmailError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                } else if (state is VerifyEmailLoaded) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const FinalyPage()),
                  );
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpcY(y: 80),
                    LailatyArabicAndEnglish(),
                    SpcY(y: 30),
                    CustomTextWidget(
                        text: 'تفقد بريدك الإلكتروني',
                        fontSize: 28,
                        color: Colors.black),
                    SpcY(y: 38),
                    CustomTextWidget(
                        text: 'ارسلنا رمز تحقق الى البريد',
                        fontSize: 16,
                        color: Colors.black),
                    CustomTextWidget(
                        text: email, fontSize: 16, color: Colors.black),
                    SpcY(y: 55),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 80 / 430),
                      child: CustomTextField(
                        controller: codeController,
                        labelText: ' 5  5  5  5  5  5 ',
                        centered: true,
                        hinted: true,
                        isNumbers: true,
                      ),
                    ),
                    SpcY(y: 30),
                    const CountdownTimer(),
                    SpcY(y: 130),
                    BlocBuilder<VerifyEmailBloc, VerifyEmailState>(
                      builder: (context, state) {
                        if (state is VerifyEmailLoading) {
                          return const CircularProgressIndicator(
                              color: ColorManager.yellow);
                        } else {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 50 / 430),
                            child: CustomButton(
                              textButton: 'تحقق',
                              onTap: () {
                                final verificationCode =
                                    codeController.text.trim();
                                context.read<VerifyEmailBloc>().add(
                                    VerifyEmailSubmitted(
                                        email: email,
                                        verificationCode: verificationCode));
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
