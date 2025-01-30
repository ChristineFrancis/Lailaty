import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/config/presentation/widget/my_sized_box.dart';

import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import 'package:lailaty/feature/choose_category_page/presentation/widgets/content_of_show_diaog.dart';

import 'package:lailaty/feature/choose_category_page/presentation/widgets/first_row_of_category_view.dart';
import 'package:lailaty/feature/choose_category_page/presentation/widgets/second_row_of_category_view.dart';
import 'package:lailaty/feature/choose_category_page/presentation/widgets/third_row_of_category_view.dart';

import '../../../../core/config/presentation/widget/custom_appbar.dart';
import '../../../../core/resources/color_manager.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List isRegister = List.generate(
    6,
    (index) => false,
  );
  void _isSelected(index) {
    setState(() {
      isRegister[index] = !isRegister[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    num heightScreen = MediaQuery.of(context).size.height;
    num widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.showCategoryCars,
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FirstRowOfCategoryView(
                    widthScreen: widthScreen,
                    heightScreen: heightScreen,
                    isRegister: isRegister,
                    drivingOnPress: () {
                      _isSelected(0);
                    },
                    weddingOnPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => contentOfShowDialog(
                          context: context,
                          widthScreen: widthScreen,
                          heightScreen: heightScreen,
                          priceLimozen: "1000",
                          onPressLimozen: () {
                            _isSelected(1);
                            context.pop();
                          },
                          onPressSidan: () {
                            _isSelected(1);
                            context.pop();
                          },
                          priceSidan: "1000",
                          onPressSuv: () {
                            _isSelected(1);
                            context.pop();
                          },
                          priceSuv: "1000",
                          onPressVipCaporleh: () {
                            _isSelected(1);
                            context.pop();
                          },
                          priceVipCaporleh: "1000",
                          onPressVipCategory: () {
                            _isSelected(1);
                            context.pop();
                          },
                          priceVipCategory: "1000",
                          onPresscaporleh: () {
                            _isSelected(1);
                            context.pop();
                          },
                          pricecaporleh: "1000",
                          onPressluxury: () {
                            _isSelected(1);
                            context.pop();
                          },
                          priceluxury: "1000",
                        ),
                      );
                    },
                  ),
                  const sizedBox40(),
                  SecondRowOfCategoryView(
                    widthScreen: widthScreen,
                    heightScreen: heightScreen,
                    isRegister: isRegister,
                    rideCarOnPress: () {
                      _isSelected(2);
                    },
                    rideMotorOnPress: () {
                      _isSelected(3);
                    },
                  ),
                  const sizedBox40(),
                  thirdRowOfCategoryView(
                    widthScreen: widthScreen,
                    heightScreen: heightScreen,
                    isRegister: isRegister,
                    modeOnPress: () {
                      _isSelected(4);
                    },
                    travellingOnPress: () {
                      _isSelected(5);
                    },
                  ),
                  const sizedBox50(),
                  MyButton(
                      title: StringManager.next,
                      onpress: () {},
                      colors: ColorManager.greyTextr,
                      width: widthScreen / 1.6,
                      height: heightScreen / 20,
                      radius: 11,
                      styleOfTExt: StyleManager.normalText18(
                          fontWeight: FontWeight.w500)),
                  const sizedBox50(),
                  InkWell(
                    onTap: () {},
                    child: HeaderText(
                        text: StringManager.switchToClient,
                        styleOfText: StyleManager.semiboldTextStyle20()),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
