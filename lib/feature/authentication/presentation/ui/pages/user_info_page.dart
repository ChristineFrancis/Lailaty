import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/home_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/login_word.dart';

import '../widgets/logo_with_laylaty.dart';
import '../widgets/temporary_widgets/custom_text_form_field_name.dart';
import '../widgets/temporary_widgets/custom_text_form_field_with_prefix.dart';
import '../widgets/temporary_widgets/detect_gender_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  int _clickCount = 0;
  bool showCar = false;
  double backArrowScale = 1;
  List vis = [true, false, false, false];
  bool male = true;

  final _formKeyMobile = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();

  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _mobileNumberValidatorController =
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

  // to validate names
  bool validateAndReturnCNT1() {
    if (_formKeyName.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double horizontalOffset;
    double verticalOffset;
    double scale;
    double imgOpacity = 0.5;
    // Adjust parameters based on click count
    switch (_clickCount) {
      case 1:
        horizontalOffset = -0.25;
        verticalOffset = 0.4;
        scale = 1.1;
        break;
      case 2:
        imgOpacity = 1;
        horizontalOffset = 0.25;
        verticalOffset = 0.12;
        scale = 0.35;
        break;
      default:
        horizontalOffset = 0.85;
        verticalOffset = 0.4;
        scale = 1.1;
    }

    const Duration animationDuration = Duration(milliseconds: 1000);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.grey1,
      body: Stack(
        children: [
          //! Background image
          AnimatedPositioned(
            duration: animationDuration,
            curve: Curves.easeOut,
            left: screenWidth * -horizontalOffset,
            top: screenHeight * verticalOffset,
            child: AnimatedScale(
              duration: animationDuration,
              curve: (_clickCount == 2) ? Curves.easeOut : Curves.easeIn,
              scale: scale,
              child: SvgPicture.asset(
                ImageAssetManager.lailatyArabic,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(imgOpacity), BlendMode.modulate),
                width: screenWidth * 1.5,
              ),
            ),
          ),
          //! -----------------

          //! logo animation
          AnimatedPositioned(
            duration: animationDuration,
            curve: Curves.easeIn,
            left: screenWidth * 0.32,
            top: (_clickCount != 2) ? screenHeight * 0.1 : screenHeight * 0.13,
            child: AnimatedScale(
              curve: Curves.easeIn,
              scale: (_clickCount == 2) ? 1.3 : 1,
              duration: animationDuration,
              child: LogoWithLaylaty(),
            ),
          ),
          //!-----------------

          //! back arrow animation
          Positioned(
            top: screenHeight * 15 / 932,
            right: screenWidth * 2 / 430,
            child: AnimatedOpacity(
              duration: animationDuration,
              opacity: (_clickCount == 2) ? 0.0 : 1.0,
              child: AnimatedScale(
                scale: backArrowScale,
                duration: Duration(microseconds: 1),
                child: _myBackArrow(),
              ),
            ),
          ),
          //! ------------------

          //!Login word animation
          Positioned(
            top: screenHeight * 0.16,
            left: screenWidth * 0.24,
            child: AnimatedOpacity(
              duration: animationDuration,
              opacity: (_clickCount == 2) ? 0.0 : 1.0,
              child: LoginWord(),
            ),
          ),
          //! ------------------

          //! bottom button
          Positioned(
            bottom: screenHeight * 20 / 932,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: AnimatedOpacity(
                opacity: (_clickCount == 2) ? 0.0 : 1.0,
                duration: animationDuration,
                child: Visibility(
                    visible: vis[1] || vis[0], child: _myButton(context))),
          ),

          //! ----------------------

          Positioned(
            top: screenHeight * 0.26,
            child: Stack(
              children: [
                //! clikc count =0
                AnimatedOpacity(
                  opacity: _clickCount == 0 ? 1.0 : 0.0,
                  duration: animationDuration,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 43 / 430),
                    child: Form(
                      key: _formKeyMobile,
                      child: Visibility(
                        visible: vis[0],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SpcY(y: 50),
                            CustomTextWidget(
                                text: 'ادخل رقمك',
                                fontSize: 30,
                                color: Colors.black),
                            SpcY(y: 25),
                            Container(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomTextWidget(
                                      text:
                                          "ادخل رقم الهاتف الفعال كمحفظة مالية",
                                      fontSize: 18,
                                      color: Colors.black),
                                ],
                              ),
                            ),
                            SpcY(y: 37.5),
                            CustomTextFormFieldWithPrefix(
                              controller: _mobileNumberController,
                              prefixText: "+20",
                              hintText: "9123456789",
                              readOnly: (_clickCount != 0),
                            ),
                            SpcY(y: 50),
                            CustomTextWidget(
                                text: "ادخل رقم الهاتف مرة اخرى للتأكيد",
                                fontSize: 18,
                                color: Colors.black),
                            SpcY(y: 37.5),
                            CustomTextFormFieldWithPrefix(
                              controller: _mobileNumberValidatorController,
                              prefixText: "+20",
                              hintText: "9123456789",
                              readOnly: (_clickCount != 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //!click count ==1

                AnimatedOpacity(
                  opacity: _clickCount == 1 ? 1.0 : 0.0,
                  duration: animationDuration,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 56 / 430),
                    child: Form(
                      key: _formKeyName,
                      child: Visibility(
                        visible: vis[1],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SpcY(y: 25),
                            CustomTextWidget(
                                text: 'المعلومات الشخصية',
                                fontSize: 28,
                                color: Colors.black),
                            SpcY(y: 37.5),
                            CustomTextWidget(
                                text:
                                    '                             :الاسم الاول',
                                fontSize: 22,
                                color: Colors.black),
                            SpcY(y: 18),
                            CustomTextFormFieldName(
                                fontSizeText: 22,
                                isReadonly: (_clickCount != 1),
                                controller: _firstNameController,
                                hintText: 'lorem ipsum     '),
                            SpcY(y: 45),
                            CustomTextWidget(
                                text:
                                    '                             :الاسم الاخير',
                                fontSize: 22,
                                color: Colors.black),
                            SpcY(y: 18),
                            CustomTextFormFieldName(
                                fontSizeText: 22,
                                isReadonly: (_clickCount != 1),
                                controller: _lastNameController,
                                hintText: 'lorem ipsum'),
                            SpcY(y: 50),
                            SizedBox(
                              width: screenWidth * 310 / 430,
                              child:
                                  DetectGenderWidget(onGenderSelected: (value) {
                                male = value;
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //!click count ==2
                AnimatedOpacity(
                  opacity: _clickCount == 2 ? 1.0 : 0.0,
                  duration: animationDuration,
                  child: Visibility(
                    visible: vis[2],
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth,
                          height: screenHeight / 1.5,
                        ),
                        Positioned(
                          top: screenHeight * 0.12,
                          child: CustomTextWidget(
                              text: "اهلا و سهلا بك في تطبيق ليلتي",
                              fontSize: 24,
                              color: Colors.black),
                        ),

                        // Animated car
                        AnimatedPositioned(
                            curve: Curves.easeOutBack,
                            duration: Duration(milliseconds: 400),
                            bottom: screenHeight * 0.1,
                            right: showCar ? 0 : -300,
                            child: SvgPicture.asset(ImageAssetManager.carPic)),

                        AnimatedPositioned(
                          duration: Duration(seconds: 1),
                          bottom: screenHeight * 0.1,
                          left: (_clickCount == 2) ? screenWidth * 0.1 : -50,
                          child:
                              SvgPicture.asset(ImageAssetManager.passengerPic),
                        ),

                        AnimatedPositioned(
                          duration: Duration(seconds: 1),
                          bottom: screenHeight * 0.1,
                          right: (_clickCount == 2) ? screenWidth * 0.15 : -50,
                          child: SvgPicture.asset(ImageAssetManager.captainPic),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //! My Widgets:

  Widget _myButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 18,
      ),
      child: CustomButton(
        textButton: 'التالي',
        textSize: 27,
        onTap: () {
          setState(() {
            if (_clickCount < 2) {
              _clickCount++;
              if (_clickCount >= 2) {
                Timer(Duration(milliseconds: 1500), () {
                  setState(() {
                    showCar = true;
                    backArrowScale = 0;
                    Timer(Duration(seconds: 3), () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                    });
                  });
                });
              }
            }

            for (int i = 0; i < 3; i++) {
              if (i == _clickCount) {
                setState(() {
                  vis[i] = true;
                });
              } else {
                Timer(Duration(seconds: 1), () {
                  setState(() {
                    vis[i] = false;
                  });
                });
              }
            }
          });
        },
      ),
    );
  }

  Widget _myBackArrow() {
    return Container(
      padding: EdgeInsets.all(3.5),
      alignment: Alignment.centerRight,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: IconButton(
            onPressed: () {
              setState(() {
                if (_clickCount == 0) {
                  Navigator.of(context).pop();
                } else {
                  _clickCount--;
                }
                if (_clickCount != 2) {
                  setState(() {
                    showCar = false;
                  });
                }

                for (int i = 0; i < 3; i++) {
                  if (i == _clickCount) {
                    setState(() {
                      vis[i] = true;
                    });
                  } else {
                    Timer(Duration(seconds: 1), () {
                      setState(() {
                        vis[i] = false;
                      });
                    });
                  }
                }
              });
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.yellowTextColor,
            )),
      ),
    );
  }
}
