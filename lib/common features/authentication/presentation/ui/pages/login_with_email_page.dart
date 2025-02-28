import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/bloc/register_bloc/register_state.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/verification_code_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20form%20fields/custom_text_field.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/login_word.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import '../../../../../core/config/storage/dependency_injection.dart';
import '../../bloc/register_bloc/register_bloc.dart';
import '../../bloc/register_bloc/register_event.dart';
import '../widgets/custom_button.dart';

class LoginWithEmailPage extends StatefulWidget {
  const LoginWithEmailPage({super.key});

  @override
  State<LoginWithEmailPage> createState() => _LoginWithEmailPageState();
}

class _LoginWithEmailPageState extends State<LoginWithEmailPage> {
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
        appBar: AppBar(
          backgroundColor: ColorManager.grey,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.yellow,
            ),
          ),
        ),
        backgroundColor: ColorManager.grey,
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
                    const SpcY(y: 20),
                    const LoginWord(),
                    const SpcY(y: 75),
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
                    CustomTextField(
                      controller: emailController,
                      labelText: 'Email',
                      textInputAction: TextInputAction.next,
                    ),
                    const SpcY(y: 15),
                    CustomTextField(
                      controller: passwordController,
                      labelText: 'Password',
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () => _submit(context),
                    ),
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        if (state is RegisterLoading) {
                          return const CircularProgressIndicator();
                        }
                        return CustomButton(
                          textButton: 'تسجيل الدخول',
                          onTap: () => _submit(context),
                        );
                      },
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
