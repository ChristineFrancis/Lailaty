// TODO: disable text form fields when its not their turns
// TODO: resizeToAvoidBottomInset: false,
// TODO: make the page responsive
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_password.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_with_prefix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/logo_with_laylaty.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/user_info_page/detect_gender_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  int _clickCount = 0;
  bool showCar = false;
  bool male = true;

  final _formKeyMobile = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();

  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _mobileNumberValidatorController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordValidatorController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // to validate mobile number
  bool validateAndReturnCNT0() {
    if (_formKeyMobile.currentState!.validate() &&
        _mobileNumberController.text == _mobileNumberValidatorController.text) {
      return true;
    } else {
      return false;
    }
  }

  // to validate password
  bool validateAndReturnCNT1() {
    if (_formKeyPassword.currentState!.validate() &&
        _passwordController.text == _passwordValidatorController.text) {
      return true;
    } else {
      return false;
    }
  }

  // to validate names
  bool validateAndReturnCNT2() {
    if (_formKeyName.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double horizontalOffset;
    double verticalOffset;
    double scale;
    double imgOpacity = 0.5;
    // Adjust parameters based on click count
    switch (_clickCount) {
      case 1:
        horizontalOffset = 0.20;
        verticalOffset = 0.4;
        scale = 1.5;
        break;
      case 2:
        horizontalOffset = -0.75;
        verticalOffset = 0.4;
        scale = 1.5;
        break;
      case 3:
        imgOpacity = 1;
        horizontalOffset = 0.25;
        verticalOffset = 0.15;
        scale = 0.35;
        break;
      default:
        horizontalOffset = 1.2;
        verticalOffset = 0.4;
        scale = 1.5;
    }

    // Animation duration
    const Duration animationDuration = Duration(milliseconds: 800);

    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: Stack(
        children: [
          // Background image with animated position and scaling
          AnimatedPositioned(
            duration: animationDuration,
            curve: Curves.easeOut,
            left: MediaQuery.of(context).size.width * -horizontalOffset,
            top: MediaQuery.of(context).size.height * verticalOffset,
            child: AnimatedScale(
              duration: animationDuration,
              curve: (_clickCount == 3) ? Curves.easeOut : Curves.easeIn,
              scale: scale, // Apply dynamic scaling
              //! my image
              child: SvgPicture.asset(
                ImageAssetManager.lailatyArabic, // Updated image asset path
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(imgOpacity), BlendMode.modulate),
                width: MediaQuery.of(context).size.width * 1.5,
              ),
            ),
          ),

          // Centered content based on _clickCount
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  LogoWithLaylaty(),
                  const SizedBox(height: 30),
                  if (_clickCount < 3)
                    CustomTextWidget(
                        text: 'تسجيل الدخول',
                        fontSize: 36,
                        color: Colors.black),
                  Stack(
                    children: [
                      //!click count ==0
                      //if (_clickCount == 0)
                      AnimatedOpacity(
                        opacity: _clickCount == 0 ? 1.0 : 0.0,
                        duration: Duration(seconds: 1),
                        child: Center(
                          child: Form(
                            key: _formKeyMobile,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 40),
                                CustomTextWidget(
                                    text: 'ادخل رقمك',
                                    fontSize: 28,
                                    color: Colors.black),
                                const SizedBox(height: 20),
                                CustomTextWidget(
                                    text: "ادخل رقم الهاتف الفعال كمحفظة مالية",
                                    fontSize: 18,
                                    color: Colors.black),
                                const SizedBox(height: 30),
                                CustomTextFormFieldWithPrefix(
                                    controller: _mobileNumberController,
                                    prefixText: "+ 20 ",
                                    hintText: "| 9123456789"),
                                const SizedBox(height: 40),
                                CustomTextWidget(
                                    text: "ادخل رقم الهاتف مرة اخرى للتأكيد",
                                    fontSize: 18,
                                    color: Colors.black),
                                const SizedBox(height: 30),
                                CustomTextFormFieldWithPrefix(
                                    controller:
                                        _mobileNumberValidatorController,
                                    prefixText: "+ 20 ",
                                    hintText: "| 9123456789"),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //!click count ==1
                      //if (_clickCount == 1)
                      AnimatedOpacity(
                        opacity: _clickCount == 1 ? 1.0 : 0.0,
                        duration: Duration(seconds: 1),
                        child: Form(
                          key: _formKeyPassword,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 40),
                                CustomTextWidget(
                                    text: 'إنشاء كلمة مرور',
                                    fontSize: 28,
                                    color: Colors.black),
                                const SizedBox(height: 30),
                                CustomTextWidget(
                                    text:
                                        '                               ادخل كلمة المرور',
                                    fontSize: 18,
                                    color: Colors.black),
                                const SizedBox(height: 20),
                                CustomTextFormFieldPassword(
                                    controller: _passwordController,
                                    hintText: '12345678'),
                                const SizedBox(height: 40),
                                CustomTextWidget(
                                    text:
                                        "       ادخل كلمة المرور مرة اخرى للتأكيد",
                                    fontSize: 18,
                                    color: Colors.black),
                                const SizedBox(height: 20),
                                CustomTextFormFieldPassword(
                                    controller: _passwordValidatorController,
                                    hintText: '12345678'),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //!click count ==2
                      // if (_clickCount == 2)
                      AnimatedOpacity(
                        opacity: _clickCount == 2 ? 1.0 : 0.0,
                        duration: Duration(seconds: 1),
                        child: Form(
                          key: _formKeyName,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),
                              CustomTextWidget(
                                  text: 'المعلومات الشخصية',
                                  fontSize: 28,
                                  color: Colors.black),
                              const SizedBox(height: 30),
                              CustomTextWidget(
                                  text:
                                      '                             :الاسم الاول',
                                  fontSize: 22,
                                  color: Colors.black),
                              const SizedBox(height: 15),
                              CustomTextFormFieldName(
                                  controller: _firstNameController,
                                  hintText: 'lorem ipsum     '),
                              const SizedBox(height: 30),
                              const SizedBox(height: 5),
                              CustomTextWidget(
                                  text:
                                      '                             :الاسم الاخير',
                                  fontSize: 22,
                                  color: Colors.black),
                              const SizedBox(height: 15),
                              CustomTextFormFieldName(
                                  controller: _lastNameController,
                                  hintText: 'lorem ipsum'),
                              const SizedBox(height: 30),
                              const SizedBox(height: 20),
                              DetectGenderWidget(onGenderSelected: (value) {
                                male = value;
                              }),
                            ],
                          ),
                        ),
                      ),

                      //!click count ==3
                      //if (_clickCount == 3)
                      AnimatedOpacity(
                        opacity: _clickCount == 3 ? 1.0 : 0.0,
                        duration: Duration(seconds: 1),
                        child: Column(
                          children: [
                            SizedBox(height: 120),
                            CustomTextWidget(
                                text: "هل انت",
                                fontSize: 36,
                                color: Colors.black),
                            SizedBox(height: 100),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // Animated car
                                AnimatedPositioned(
                                    curve: Curves.easeOutBack,
                                    duration: Duration(milliseconds: 400),
                                    right: showCar ? 0 : -300,
                                    child: SvgPicture.asset(
                                        ImageAssetManager.carPic)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SvgPicture.asset(
                                        ImageAssetManager.passengerPic),
                                    SvgPicture.asset(
                                        ImageAssetManager.captainPic),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Bottom button to increment _clickCount
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
                child: CustomElevatedButton(
                    text: "تحقق",
                    onPressed: () {
                      setState(() {
                        if (_clickCount < 3) {
                          _clickCount++;
                          if (_clickCount >= 3) {
                            Timer(Duration(milliseconds: 1500), () {
                              setState(() {
                                showCar = true;
                              });
                            });
                          }
                        }
                      });
                    }, textColor: Colors.black,buttonColor: ColorManager.yellow, fontSize: 27,)),
          ),
        ],
      ),
    );
  }
}
