import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/captain/captain_image.dart';
import 'package:lailaty/core/config/presentation/widget/imageProduct.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/core/viewmodels/filter_order_view_model.dart';
import 'package:lailaty/feature/travel/presentation/view/order_history.dart';
import 'package:lailaty/feature/travel/presentation/view/orders_page.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/custom_drawer/drawer_option.dart';
import 'package:lailaty/feature/wedding_business/presentation/view/widding_and_business_history.dart';
import 'package:lailaty/feature/wedding_business/presentation/view/widding_and_business_order_page.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.6,
      child: Drawer(
        backgroundColor: ColorManager.grey1,
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              InkWell(
                onTap: () {
                  context.push(AppKeys.profilePageKey);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // const Icon(
                      //   Icons.arrow_back_ios,
                      //   color: ColorManager.backGroundColor,
                      // ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringManager.exampleCaptainName,
                            style: StyleManager.boldTextStyle24(
                              size: context.screenWidth * 0.06,
                              color: ColorManager.black,
                            ),
                          ),
                          //! make function depend on the back the star will filled
                          Row(
                            children: [
                              Icon(
                                Icons.star_border,
                                color: ColorManager.yellowAccent,
                                size: context.screenWidth * 0.04,
                              ),
                              Icon(
                                Icons.star_border,
                                color: ColorManager.yellowAccent,
                                size: context.screenWidth * 0.04,
                              ),
                              Icon(
                                Icons.star_border,
                                color: ColorManager.yellowAccent,
                                size: context.screenWidth * 0.04,
                              ),
                              Icon(
                                Icons.star_border,
                                color: ColorManager.yellowAccent,
                                size: context.screenWidth * 0.04,
                              ),
                            ],
                          ),
                        ],
                      ),
                      ImageProduct(image: "d")
                    ],
                  ),
                ),
              ),
              Divider(
                color: ColorManager.black,
                endIndent: context.screenWidth * 0.04,
                indent: context.screenWidth * 0.04,
              ),
              DrawerOption(
                icon: Icons.directions_car_outlined,
                text: StringManager.withinTheCityCar,
                onTap: () {
                  context.push(
                    AppKeys.searchOrderPage,
                  );
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.directions_car_outlined,
                text: StringManager.travelTitle,
                onTap: () {
                  context.push(
                    AppKeys.dynamicPageViewKey,
                    extra: {
                      AppKeys.appBarTitleKey: StringManager.travelTitle,
                      AppKeys.pagesKey: [
                        ChangeNotifierProvider(
                          //! changed
                          create: (_) {
                            final orderViewModel = FilterOrderViewModel();
                            orderViewModel
                                .initializeOrders(getClientTripDetails());
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
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.directions_car_outlined,
                text: StringManager.weddingBusiness,
                onTap: () {
                  context.push(
                    AppKeys.dynamicPageViewKey,
                    extra: {
                      AppKeys.appBarTitleKey: StringManager.weddingBusiness,
                      AppKeys.pagesKey: [
                        ChangeNotifierProvider(
                          create: (_) {
                            final orderViewModel = FilterOrderViewModel();
                            orderViewModel
                                .initializeOrders(getClientTripDetails());
                            return orderViewModel;
                          },
                          child: const WiddingAndBusinessHistoryPage(),
                        ),
                        const WiddingAndBusinessOrderPage(),
                      ],
                      AppKeys.initialIndexKey: 1,
                    },
                  );
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.directions_car_outlined,
                text: StringManager.drivingEducation,
                onTap: () {
                  context.push(AppKeys.completeTeachDrivingOrderPage, extra: {
                    AppKeys.initialContainerKey:
                        AppKeys.requestToTeachDrivingAndWithYourModeContainer
                  });
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.directions_car_outlined,
                text: StringManager.onYourMode,
                onTap: () {
                  context.push(AppKeys.completeOnYourMoodOrderPage, extra: {
                    AppKeys.initialContainerKey:
                        AppKeys.requestToTeachDrivingAndWithYourModeContainer
                  });
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.directions_car_outlined,
                text: StringManager.completeTheOrder,
                onTap: () {
                  context.push(
                    AppKeys.completeOrderInlandTransportationPage,
                    extra: {
                      AppKeys.initialContainerKey:
                          AppKeys.confirmSuggestedPriceForTripAndRideContainer
                    },
                  );
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.verified_user_outlined,
                text: StringManager.safety,
                onTap: () {
                  context.push(AppKeys.safetyPageKey);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.settings_outlined,
                text: StringManager.settings,
                onTap: () {
                  context.push(AppKeys.settingsPageKey);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.share_outlined,
                text: StringManager.shareApp,
                onTap: () {
                  context.push(AppKeys.shareAppPageKey);
                },
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              DrawerOption(
                icon: Icons.support_agent,
                text: StringManager.callUs,
                onTap: () {
                  context.push(AppKeys.callUsPageKey);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
