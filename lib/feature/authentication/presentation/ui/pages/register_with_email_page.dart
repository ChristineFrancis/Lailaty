import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/register_bloc/register_state.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/login_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/verification_code_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/text_fields/custom_text_field.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';

import '../../../../../core/config/storage/dependency_injection.dart';
import '../../bloc/register_bloc/register_bloc.dart';
import '../../bloc/register_bloc/register_event.dart';
import '../widgets/custom_button.dart';

class RegisterWithEmailPage extends StatefulWidget {
  const RegisterWithEmailPage({super.key});

  @override
  State<RegisterWithEmailPage> createState() => _RegisterWithEmailPageState();
}

class _RegisterWithEmailPageState extends State<RegisterWithEmailPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    context.read<RegisterBloc>().add(
          RegisterWithEmailEvent(email: email, password: password),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorManager.grey1,
        body: BlocProvider(
          create: (_) => sl<RegisterBloc>(),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is RegisterLoaded) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        VerificationCodePage(email: emailController.text),
                  ),
                );
              }
            },
            child: Builder(builder: (context) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 45,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SpcY(y: 30),
                    _registerWord(),
                    const SpcY(y: 50),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final imageHeight = constraints.maxWidth / 2.3;
                        return Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const LailatyArabicAndEnglish(),
                              const SizedBox(width: 6),
                              Container(
                                width: 3,
                                height: imageHeight,
                                color: ColorManager.yellowTextColor,
                              ),
                              const SizedBox(width: 6),
                              SvgPicture.asset(
                                ImageAssetManager.loginAmico,
                                width: imageHeight,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SpcY(y: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 50 / 430),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                              text: 'الرجاء إدخال البريد الالكتروني',
                              fontSize: 18,
                              color: Colors.black),
                          SpcY(y: 15),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomTextField(
                              controller: emailController,
                              labelText: 'Email',
                              textInputAction: TextInputAction.next,
                              isEmail: true,
                            ),
                          ),
                          SpcY(y: 30),
                          CustomTextWidget(
                              text: 'الرجاء إدخال كلمة المرور',
                              fontSize: 18,
                              color: Colors.black),
                          const SpcY(y: 15),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomTextField(
                              controller: passwordController,
                              labelText: 'Password',
                              obscureText: true,
                              textInputAction: TextInputAction.done,
                              onEditingComplete: () => _submit(context),
                            ),
                          ),
                          SpcY(y: 70),
                          BlocBuilder<RegisterBloc, RegisterState>(
                            builder: (context, state) {
                              if (state is RegisterLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                        color: ColorManager.yellowTextColor));
                              }
                              return CustomButton(
                                textButton: 'إنشاء حساب',
                                onTap: () => _submit(context),
                              );
                            },
                          ),
                          SpcY(y: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                  text: 'هل لديك حساب مسبقاً؟   ',
                                  fontSize: 10,
                                  color: Colors.black),
                              InkWell(
                                child: CustomTextWidget(
                                    text: 'تسجيل الدخول',
                                    fontSize: 12,
                                    color: ColorManager.yellowTextColor),
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (route) => false);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

Widget _registerWord() {
  return Text(
    'إنشاء حساب',
    style: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 35,
      shadows: [
        Shadow(
          offset: Offset(0.9, 0.9),
          blurRadius: 0.5,
          color: Colors.black.withOpacity(0.5),
        ),
      ],
    ),
  );
}



/**/