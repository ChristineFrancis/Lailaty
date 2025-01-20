import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/go_router/go_router.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/core/viewmodels/filter_order_view_model.dart';
import 'package:lailaty/feature/travel/presentation/view/order_history.dart';
import 'package:lailaty/feature/travel/presentation/view/orders_page.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/custom_drawer/custom_drawer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes().router,
      debugShowCheckedModeBanner: false,
    );
  }
}

//! fixing the call us page : >> text <<
//! editing car in the profile <<

// adding new car form profile page
// fixing the date picker in the birthdate

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              context.push(
                AppKeys.dynamicPageViewKey,
                extra: {
                  AppKeys.appBarTitleKey: StringManager.travelTitle,
                  AppKeys.pagesKey: [
                    ChangeNotifierProvider(
                      create: (_) {
                        final orderViewModel = FilterOrderViewModel();
                        orderViewModel.initializeOrders(getClientTripDetails());
                        return orderViewModel;
                      },
                      child: const TravelOrderHistoryPage(),
                    ),
                    const TravelOrdersPage(),
                  ],
                  AppKeys.initialIndexKey: 1,
                },
              );
            },
            child: Text('travel')),
      ),
    );
  }
}
