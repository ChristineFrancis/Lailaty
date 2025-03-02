import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/common%20features/authentication/presentation/bloc/verify_email_bloc/verify_email_bloc.dart';
import 'package:lailaty/common%20features/authentication/presentation/bloc/verify_email_bloc/verify_email_event.dart';
import 'package:lailaty/common%20features/authentication/presentation/bloc/verify_email_bloc/verify_email_state.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/finaly_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/config/storage/dependency_injection.dart';
import '../widgets/pages widgets/verification_code_page/countdown_timer.dart';

class VerificationCodePage extends StatefulWidget {
  final String email;
  const VerificationCodePage({super.key, required this.email});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final TextEditingController codeController = TextEditingController();
  bool isTimerFinished = false;

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                } else if (state is VerifyEmailResendSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                  setState(() {
                    isTimerFinished = false;
                    //!  برست التايمر و بفضي التيكست فيلد
                  });
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SpcY(y: 100),
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
                        text: widget.email, fontSize: 16, color: Colors.black),
                    SpcY(y: 55),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 80 / 430),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 6,
                          controller: codeController,
                          onChanged: (value) {},
                          onCompleted: (value) {
                            FocusScope.of(context).unfocus();
                            //todo: ما عميعمل سبمت لحالو لما كمل ادخال
                            Future.delayed(const Duration(seconds: 1), () {
                              context.read<VerifyEmailBloc>().add(
                                    VerifyEmailSubmitted(
                                      email: widget.email,
                                      verificationCode: value,
                                    ),
                                  );
                            });
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8),
                            fieldHeight: 50,
                            fieldWidth: screenWidth * 42 / 430,
                            activeColor: Colors.black,
                            selectedColor: ColorManager.yellow,
                            inactiveColor: ColorManager.yellow,
                          ),
                          autoDismissKeyboard: true,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SpcY(y: 30),
                    CountdownTimer(
                      maxTime: 600,
                      onTimerComplete: () {
                        setState(() {
                          isTimerFinished = true;
                        });
                      },
                    ),
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
                              textButton: isTimerFinished
                                  ? 'إعادة إرسال الرمز'
                                  : 'تحقق',
                              onTap: () {
                                if (isTimerFinished) {
                                  // todo : resend verification code is not working
                                  context.read<VerifyEmailBloc>().add(
                                        ResendVerificationCodeSubmitted(
                                            email: widget.email.trim()),
                                      );
                                } else {
                                  final verificationCode =
                                      codeController.text.trim();
                                  if (verificationCode.length == 6) {
                                    context.read<VerifyEmailBloc>().add(
                                          VerifyEmailSubmitted(
                                            email: widget.email,
                                            verificationCode: verificationCode,
                                          ),
                                        );
                                  }
                                }
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
