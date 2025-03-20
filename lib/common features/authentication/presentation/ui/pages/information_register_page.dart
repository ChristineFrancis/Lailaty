import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text_fields/custom_text_field.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/date_picker_widget.dart';
import '../../../../../core/resources/asset_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../domain/entities/info_register_request.dart';
import '../../bloc/information_register_bloc/information_register_bloc.dart';
import '../../bloc/information_register_bloc/information_register_event.dart';
import '../../bloc/information_register_bloc/information_register_state.dart';
import '../widgets/custom widgets/text widgets/custom_text_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/logo_with_laylaty.dart';
import 'user_details_page.dart';

class InformationRegisterPage extends StatefulWidget {
  final String email;
  const InformationRegisterPage({super.key, required this.email});

  @override
  State<InformationRegisterPage> createState() =>
      _InformationRegisterPageState();
}

class _InformationRegisterPageState extends State<InformationRegisterPage> {
  //!------------------------CONTROLLERS--------------------------------
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  String selectedGender = 'male';
  final String city = 'egypt';
  final String role = 'client';
  final TextEditingController deviceTokenController = TextEditingController(
      text: 'qwerasdfzxcv'); //TODO: get the device token from a package

  //!---------------------ANIMATION VARIABLES---------------------------
  int _clickCount = 0;
  bool showCar = false;
  double backArrowScale = 1; 
  List vis = [true, false, false, false]; 

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    birthDateController.dispose();
    deviceTokenController.dispose();
    super.dispose();
  }

  void _submitInformation(BuildContext context) {
    final request = InfoRegisterRequest(
      email: widget.email.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      phoneNumber: "+20${phoneNumberController.text.trim()}",
      gender: selectedGender,
      birthDate: birthDateController.text.trim(), // Expect format: YYYY-MM-DD
      city: city,
      role: role,
      deviceToken: deviceTokenController.text.trim(),
    );
    context
        .read<InformationRegisterBloc>()
        .add(InformationRegisterSubmitted(request: request));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    const Duration animationDuration = Duration(milliseconds: 1000);

    //! background animation
    double horizontalOffset;
    double verticalOffset;
    double scale;
    double imgOpacity = 0.5;

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.grey,
      body: BlocListener<InformationRegisterBloc, InformationRegisterState>(
        listener: (context, state) {
          if (state is InformationRegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(state.message), backgroundColor: Colors.red),
            );
          } else if (state is InformationRegisterLoaded) {
            Timer(Duration(milliseconds: 1500), () {
              setState(() {
                _clickCount = 2;
                vis[2] = true;
                vis[1] = false;


                Timer(Duration(milliseconds: 1500), () {
                  setState(() {
                    showCar = true;
                    backArrowScale = 0;
                    Timer(Duration(seconds: 5), () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => UserDetailsPage()),
                          (route) => false);
                    });
                  });
                });
              });
            });
          }
        },
        child: Stack(
          children: [
            //!Background Image
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

            //! logo animation
            AnimatedPositioned(
              duration: animationDuration,
              curve: Curves.easeIn,
              left: screenWidth * 0.32,
              top:
                  (_clickCount != 2) ? screenHeight * 0.1 : screenHeight * 0.13,
              child: AnimatedScale(
                curve: Curves.easeIn,
                scale: (_clickCount == 2) ? 1.3 : 1,
                duration: animationDuration,
                child: LogoWithLaylaty(),
              ),
            ),

            //! back arrow animation
            Positioned(
              top: screenHeight * 15 / 932,
              right: screenWidth * 2 / 430,
              child: AnimatedOpacity(
                duration: animationDuration,
                opacity: (_clickCount == 1) ? 1.0 : 0.0,
                child: AnimatedScale(
                  scale: backArrowScale,
                  duration: Duration(microseconds: 1),
                  child: _myBackArrow(),
                ),
              ),
            ),

            //!Login word animation
            Positioned(
              top: screenHeight * 0.16,
              left: screenWidth * 0.19,
              child: AnimatedOpacity(
                duration: animationDuration,
                opacity: (_clickCount == 2) ? 0.0 : 1.0,
                child: CustomTextWidget(
                  text: 'تسجيل المعلومات',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),

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

            //!-----------------------------------
            Positioned(
              child: Stack(
                children: [
                  //! clikc count = 0
                  AnimatedOpacity(
                    opacity: _clickCount == 0 ? 1.0 : 0.0,
                    duration: animationDuration,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 43 / 430),
                      child: Visibility(
                        visible: vis[0],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SpcY(y: 300),
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
                            CustomTextField(
                              controller: phoneNumberController,
                              labelText: '9123456789',
                              hinted: true,
                              isPhone: true,
                              hasPrefix: true,
                              prefixText: '+20',
                              textInputAction: TextInputAction.next,
                            ),
                            SpcY(y: 50),
                            CustomTextWidget(
                                text: "     ادخل تاريخ الولادة الخاص بك",
                                fontSize: 18,
                                color: Colors.black),
                            SpcY(y: 37.5),
                            DatePickerWidget(controller: birthDateController),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //! click count = 1
                  AnimatedOpacity(
                    opacity: _clickCount == 1 ? 1.0 : 0.0,
                    duration: animationDuration,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 56 / 430),
                      child: Visibility(
                        visible: vis[1],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SpcY(y: 220),
                            CustomTextWidget(
                                text: ':الاسم الاول',
                                fontSize: 20,
                                color: Colors.black),
                            SpcY(y: 18),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CustomTextField(
                                controller: firstNameController,
                                hinted: true,
                                labelText: '    lorem ipsum',
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SpcY(y: 45),
                            CustomTextWidget(
                                text: ':الاسم الاخير',
                                fontSize: 20,
                                color: Colors.black),
                            SpcY(y: 18),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: CustomTextField(
                                controller: lastNameController,
                                hinted: true,
                                labelText: '    lorem ipsum',
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            SpcY(y: 75),
                            _genderWidget(context),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //! click count = 2
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
                            height: screenHeight,
                          ),
                          Positioned(
                            top: screenHeight * 0.4,
                            child: CustomTextWidget(
                                text: "اهلا و سهلا بك في تطبيق ليلتي",
                                fontSize: 24,
                                color: Colors.black),
                          ),

                          //! Animated car
                          AnimatedPositioned(
                              curve: Curves.easeOutBack,
                              duration: Duration(milliseconds: 400),
                              bottom: screenHeight * 0.13,
                              right: showCar ? 0 : -300,
                              child:
                                  SvgPicture.asset(ImageAssetManager.carPic)),

                          AnimatedPositioned(
                            duration: Duration(seconds: 1),
                            bottom: screenHeight * 0.13,
                            left: (_clickCount == 2) ? screenWidth * 0.1 : -50,
                            child: SvgPicture.asset(
                                ImageAssetManager.passengerPic),
                          ),

                          AnimatedPositioned(
                            duration: Duration(seconds: 1),
                            bottom: screenHeight * 0.13,
                            right:
                                (_clickCount == 2) ? screenWidth * 0.15 : -50,
                            child:
                                SvgPicture.asset(ImageAssetManager.captainPic),
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
      ),
    );
  }
  //!------------------MY WIDGETS-------------------

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
            if (_clickCount == 0) {
              _clickCount++;
            } else {
              _submitInformation(context);
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
                if (_clickCount == 1) _clickCount--;

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
              color: ColorManager.yellow,
            )),
      ),
    );
  }

  Widget _genderWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding:
              EdgeInsets.only(left: MediaQuery.sizeOf(context).width * 0.1),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<String>(
            icon: Icon(
              Icons.arrow_drop_down,
              size: MediaQuery.sizeOf(context).width * 0.07,
              color: Colors.black,
            ),
            value: selectedGender,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  selectedGender = value;
                });
              }
            },
            items: [
              DropdownMenuItem(
                value: 'male',
                child: CustomTextWidget(
                    text: 'ذكر', fontSize: 14, color: Colors.black),
              ),
              DropdownMenuItem(
                value: 'female',
                child: CustomTextWidget(
                    text: 'انثى', fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
        CustomTextWidget(text: ":الجنس", fontSize: 20, color: Colors.black)
      ],
    );
  }
}
