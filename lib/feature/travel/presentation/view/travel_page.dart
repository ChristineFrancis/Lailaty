import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/travel/presentation/view/order_history.dart';
import 'package:lailaty/feature/travel/presentation/view/orders_page.dart';
import 'package:lailaty/feature/travel/presentation/widgets/travel_page/custom_bottom_navBar.dart';
import 'package:lailaty/feature/travel/presentation/widgets/travel_page/custom_drawer.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  int _selectedIndex = 1;
  final List<Widget> _pages = const [
    OrderHistoryPage(),
    OrdersPage(),
  ];

  void _openRightDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        centerTitle: true,
        title: const Text(
          StringManager.travelTitle,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorManager.black,
          ),
        ),
        backgroundColor: ColorManager.grey1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => _openRightDrawer(context),
                icon: const Icon(
                  Icons.menu,
                  color: ColorManager.black,
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: ColorManager.backGroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}
