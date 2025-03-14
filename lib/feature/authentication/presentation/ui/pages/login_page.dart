import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/config/storage/dependency_injection.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/register_with_email_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/user_info_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/login_word.dart';
import '../../bloc/forgot_password_bloc/forgot_password_bloc.dart';
import '../../bloc/forgot_password_bloc/forgot_password_event.dart';
import '../../bloc/forgot_password_bloc/forgot_password_state.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../bloc/login_bloc/login_event.dart';
import '../../bloc/login_bloc/login_state.dart';
import '../widgets/custom widgets/custom spaces/spc_y.dart';
import '../widgets/custom widgets/text_fields/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/lailaty_arabic_and_english.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  void _submitLogin(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text;
    context
        .read<LoginBloc>()
        .add(LoginSubmitted(email: email, password: password));
  }

  void _submitForgotPassword(BuildContext context) {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("الرجاء إدخال الإيميل لاعادة ضبط كلمة السر"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      context
          .read<ForgotPasswordBloc>()
          .add(ForgotPasswordSubmitted(email: email));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorManager.grey1,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(create: (_) => sl<LoginBloc>()),
            BlocProvider<ForgotPasswordBloc>(
                create: (_) => sl<ForgotPasswordBloc>()),
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (state is LoginLoaded) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const UserInfoPage()),
                    );
                  }
                },
              ),
              BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
                listener: (context, state) {
                  if (state is ForgotPasswordError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else if (state is ForgotPasswordLoaded) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.response.message),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
              ),
            ],
            child: Builder(builder: (context) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 45,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    const SpcY(y: 30),
                    const LoginWord(),
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
                    const SpcY(y: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).size.width * 50 / 430,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                              text: 'الرجاء إدخال البريد الالكتروني',
                              fontSize: 18,
                              color: Colors.black),
                          const SpcY(y: 15),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomTextField(
                              controller: emailController,
                              labelText: 'Email',
                              textInputAction: TextInputAction.next,
                              isEmail: true,
                            ),
                          ),
                          const SpcY(y: 30),
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
                              onEditingComplete: () => _submitLogin(context),
                            ),
                          ),
                          const SpcY(y: 5),
                          InkWell(
                            onTap: () => _submitForgotPassword(context),
                            child: CustomTextWidget(
                              text: 'نسيت كلمة المرور',
                              fontSize: 10,
                              color: ColorManager.yellowTextColor,
                            ),
                          ),
                          const SpcY(y: 45),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return Container(
                                    alignment: Alignment.center,
                                    child: CircularProgressIndicator(
                                        color: ColorManager.yellowTextColor));
                              }
                              return CustomButton(
                                textButton: 'تسجيل الدخول',
                                onTap: () => _submitLogin(context),
                              );
                            },
                          ),
                          const SpcY(y: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                  text: 'ليس لديك حساب؟   ',
                                  fontSize: 10,
                                  color: Colors.black),
                              InkWell(
                                child: CustomTextWidget(
                                    text: 'إنشاء حساب',
                                    fontSize: 12,
                                    color: ColorManager.yellowTextColor),
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterWithEmailPage()),
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
