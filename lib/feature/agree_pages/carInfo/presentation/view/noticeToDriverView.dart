import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';

import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import '../../../../../core/presentation/widget/accept_button_customer.dart';
import '../../../../../core/resources/key_manager.dart';

class NoticeToDriverView extends StatelessWidget {
  const NoticeToDriverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.noticeToDriver,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: HeaderText(
                        text: StringManager.dearDriver,
                        styleOfText: StyleManager.semiboldTextStyle20()),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: StringManager.noticeContentFirstPart,
                            style: StyleManager.smallBlackText16()),
                      ],
                    ),
                  ),
                  const sizedBox30(),
                  acceptButtonCustomer(
                    text: StringManager.next,
                    onPress: () {
                      context.push(AppKeys.showCategoryPath);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
