import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/presentation/widget/accept_button_customer.dart';
import 'package:lailaty/core/presentation/widget/imageProduct.dart';
import 'package:lailaty/core/presentation/widget/my_button_with_border.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class NewOrderContentFleetView extends StatelessWidget {
  const NewOrderContentFleetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Card(
                  elevation: 7,
                  shadowColor: ColorManager.grey2,
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
                                ImageProduct(image: "d"),
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            acceptButtonCustomer(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.5,
                                                text: StringManager.accept,
                                                onPress: () {}),
                                            myButtonWithBorder(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.5,
                                              text: StringManager.refuse,
                                              onpressed: () {},
                                              colorBorder: ColorManager.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios_sharp),
                                    onPressed: () {
                                      context
                                          .push(AppKeys.profileOfcaptainFleet);
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
