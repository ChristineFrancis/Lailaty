import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/finaly_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/register_with_email_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/login_word.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import '../../../../../core/config/storage/dependency_injection.dart';
import '../../../../../core/resources/asset_manager.dart';
import '../../bloc/login_bloc/login_bloc.dart';
import '../../bloc/login_bloc/login_event.dart';
import '../../bloc/login_bloc/login_state.dart';
import '../widgets/custom widgets/custom spaces/spc_y.dart';
import '../widgets/custom widgets/text_fields/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/lailaty_arabic_and_english.dart';

/*
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
   // double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (_) => sl<LoginBloc>(),
        child: BlocListener<LoginBloc, LoginState>(
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
                MaterialPageRoute(builder: (_) => const FinalyPage()),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        final email = emailController.text.trim();
                        final password = passwordController.text;
                        context.read<LoginBloc>().add(
                          LoginSubmitted(email: email, password: password),
                        );
                      },
                      child: const Text('Login'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/

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

  void _submit(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text;
    context
        .read<LoginBloc>()
        .add(LoginSubmitted(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorManager.grey,
        body: BlocProvider(
          create: (_) => sl<LoginBloc>(),
          child: BlocListener<LoginBloc, LoginState>(
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
                  MaterialPageRoute(builder: (_) => const FinalyPage()),
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
                                color: ColorManager.yellow,
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
                          SpcY(y: 70),//55
                          BlocBuilder<LoginBloc, LoginState>(
                              builder: (context, state) {
                            if (state is LoginLoading) {
                              return Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                      color: ColorManager.yellow));
                            }
                            return CustomButton(
                              textButton: 'تسجيل الدخول',
                              onTap: () => _submit(context),
                            );
                          }),
                          SpcY(y: 10),
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
                                    color: ColorManager.yellow),
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterWithEmailPage()),
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
