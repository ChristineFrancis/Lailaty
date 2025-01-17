import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/feature/travel/presentation/widgets/bottom_sheet_container.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/city_row.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/client_trip_details.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/filter_container.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/orders_overview_container.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  // bool _isFilterVisible = false;

  // void _toggleFilterVisibility() {
  //   setState(() {
  //     _isFilterVisible = !_isFilterVisible;
  //   });
  // }

  void _showDetailsSheet(
      {required ClientTripDetailsModel clientTripDetailsModel}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetContainer(
          firstBottonText: StringManager.acceptAnOffer,
          secondBottonText: StringManager.suggestYourPrice,
          thirdBottonText: StringManager.viewOnMap,
          secondBottonColor: ColorManager.whiteColor,
          thirdBottonColor: ColorManager.yellowTextColor,
          clientTripDetailsModel: clientTripDetailsModel,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrdersOverviewContainer(),
        const FilterContainer(),
        // if (_isFilterVisible) FilterContainer(),

        // SizedBox(
        //   height: context.screenHeight * 0.025,
        // ),
        // const FilterContainer(),
        // SizedBox(
        //   height: context.screenHeight * 0.025,
        // ),
        Expanded(
          child: ListView.builder(
            itemCount: getClientTripDetails().length,
            itemBuilder: (context, index) {
              final order = getClientTripDetails()[index];
              return ClientTripDetailsContainer(
                widget: CityRow(
                  city: order.captainName,
                  letter: '',
                  radius: context.screenWidth * 0.055,
                  backGroundColor: ColorManager.yellowTextColor,
                ),
                clientTripDetailsModel: getClientTripDetails()[index],
                onTap: () => _showDetailsSheet(
                  clientTripDetailsModel: getClientTripDetails()[index],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.01,
        ),
      ],
    );
  }
}
