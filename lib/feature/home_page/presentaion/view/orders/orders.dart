import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/config/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import 'package:lailaty/feature/home_page/widgets/details_of_order.dart';
import 'package:lailaty/feature/home_page/widgets/name_with_review.dart';
import 'package:lailaty/feature/home_page/widgets/option_of_icons_with_text.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  List<bool> isIconRowVisible = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: isIconRowVisible.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(4),
          color: ColorManager.grey1,
          child: !isIconRowVisible[index]
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const nameWithStars(
                            name: "dd",
                            starRating: "2",
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 22,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const detailsOfOrder(
                                  typeOrder: "trip",
                                  distance: "33 km",
                                  price: "333 egb",
                                  aPoint: "give",
                                  bPoint:
                                      "alahakbar alahakbaralahakbaralahakbar",
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                    icon: Icon(Icons.more_vert),
                                    onPressed: () {
                                      setState(() {
                                        isIconRowVisible[index] =
                                            !isIconRowVisible[index];
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const sizedBox50()
                    ],
                  ),
                )
              : Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.more_vert),
                        onPressed: () {
                          setState(() {
                            isIconRowVisible[index] = !isIconRowVisible[index];
                          });
                        },
                      ),
                    ),
                    optionOfIconWithText(
                      listOfOnTap: [() {}, () {}, () {}],
                    ),
                    const sizedBox30()
                  ],
                ),
        ),
      ),
    );
  }
}
