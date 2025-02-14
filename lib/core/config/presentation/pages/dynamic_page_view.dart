import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/custom_drawer/custom_bottom_navbar.dart';
import 'package:lailaty/core/config/presentation/widget/wedding_bottom_nav_bar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/custom_drawer/custom_drawer.dart';

//! string
//! list of widgets
class DynamicPageView extends StatefulWidget {
  final String appBarTitle;
  final List<Widget> pages;
  final int initialIndex;

  const DynamicPageView({
    super.key,
    required this.appBarTitle,
    required this.pages,
    this.initialIndex = 1,
  });

  @override
  State<DynamicPageView> createState() => _DynamicPageViewState();
}

class _DynamicPageViewState extends State<DynamicPageView> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  //int _selectedIndex = 1;
  // final List<Widget> _pages = [
  //   ChangeNotifierProvider(
  //     //! changed
  //     create: (_) {
  //       final orderViewModel = FilterOrderViewModel();
  //       orderViewModel.initializeOrders(getClientTripDetails());
  //       return orderViewModel;
  //     },
  //     child: const TravelOrderHistoryPage(),
  //   ),
  //   const TravelOrdersPage(),
  // ];

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
        title: Text(
          widget.appBarTitle, // StringManager.travelTitle, //! changed
          style: const TextStyle(
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
      body: widget.pages[_selectedIndex],
      bottomNavigationBar: CustomWeddingBottomNavBar(
          currentIndex: _selectedIndex, onTap: _onItemTapped, context: context),
      endDrawer: const CustomDrawer(),
    );
  }
}
