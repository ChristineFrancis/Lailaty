import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/config/presentation/widget/accept_button_customer.dart';
import 'package:lailaty/core/config/presentation/widget/my_button_with_border.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/feature/home_page/widgets/name_with_review.dart';

class NewOrderContentFleetView extends StatelessWidget {
  const NewOrderContentFleetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: ColorManager.grey1),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 15,
                            backgroundColor: ColorManager.yellowAccent,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 22,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderText(
                                  text: "back",
                                  styleOfText: StyleManager.normalText18()),
                              HeaderText(
                                  text: "car",
                                  styleOfText: StyleManager.smallBlackText16()),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 22,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      acceptButtonCustomer(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3.5,
                                          text: StringManager.accept,
                                          onPress: () {}),
                                      myButtonWithBorder(
                                        width:
                                            MediaQuery.of(context).size.width /
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
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
