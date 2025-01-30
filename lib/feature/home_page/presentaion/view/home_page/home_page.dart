import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/config/widget/myButton.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/feature/home_page/presentaion/view/orders/search_orders_page.dart';
import 'package:lailaty/feature/home_page/presentaion/view/performance_page/performance_page.dart';
import 'package:lailaty/feature/home_page/presentaion/view/wallet/wallet_page.dart';
import 'package:lailaty/feature/home_page/widgets/my_bottom_navigation_bar.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HomePageView extends StatefulWidget {
  HomePageView({super.key});
  int currentIndex = 2;

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late bool isConnected;
  void _isConnected() {
    setState(() {
      isConnected = !isConnected;
    });
    print(isConnected);
  }

  @override
  void initState() {
    isConnected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      const WalletPage(),
      const PerformancePage(),
      isConnected
          ? SearchOrderPage()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderText(
                    text: StringManager.areYouReadytoRecieveOrders,
                    styleOfText: StyleManager.semiboldTextStyle20()),
                SvgPicture.asset(
                  ImageAssetManager.noConnectImage,
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width / 3,
                ),
                MyButton(
                    title: StringManager.startRecieveOrders,
                    onpress: _isConnected,
                    colors: ColorManager.grey1,
                    width: MediaQuery.of(context).size.width / 1.7,
                    height: MediaQuery.of(context).size.height / 16,
                    radius: 11,
                    styleOfTExt: StyleManager.smallBlackText16())
              ],
            )
    ];

    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.list))],
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          backgroundColor: ColorManager.greyTextr,
          title: Center(
            child: SizedBox(
              height: 33,
              width: MediaQuery.of(context).size.width / 2.3,
              child: LiteRollingSwitch(
                onTap: () {
                  _isConnected();
                },
                onDoubleTap: () {},
                onSwipe: () {},
                onChanged: (bool j) {},
                value: isConnected,
                colorOff: ColorManager.red,
                colorOn: ColorManager.yellowTextColor,
                textOff: StringManager.notConnect,
                textOn: StringManager.connect,
                iconOff: Icons.close,
              ),
            ),
          ),
        ),
        body: pages[widget.currentIndex],
        bottomNavigationBar: myBottomNavigationBar(
            context: context,
            currentIndex: widget.currentIndex,
            onTap: (index) {
              setState(() {
                widget.currentIndex = index;
              });
            }));
  }
}
