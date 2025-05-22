import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/presentation/widget/imageProduct.dart';

import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import '../../widgets/fleet_content_home_page_widget/row_of_two_text_with_icon.dart';

class FleetContentView extends StatelessWidget {
  const FleetContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Card(
                  shadowColor: ColorManager.grey2,
                  elevation: 7,
                  child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorManager.grey1),
                          borderRadius: BorderRadius.circular(11),
                          color: ColorManager.backGroundColor),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ImageProduct(image: ""),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 22,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeaderText(
                                        text: "back",
                                        styleOfText:
                                            StyleManager.normalText18()),
                                    HeaderText(
                                        text: "car",
                                        styleOfText:
                                            StyleManager.smallBlackText16()),
                                    twoTextWithIconsInRow(
                                      textStar: "3",
                                      textTrendUp: "22 trip",
                                    )
                                  ],
                                )),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios_sharp),
                                    onPressed: () {
                                      context.push(AppKeys.profileOfcaptainFleet);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                )),
      ),
    );
  }
}
