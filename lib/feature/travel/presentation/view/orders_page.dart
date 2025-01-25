import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/bottom_sheet_container.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/city_row.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/client_trip_details.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/filter_container.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/orders_overview_container.dart';

class TravelOrdersPage extends StatefulWidget {
  const TravelOrdersPage({super.key});

  @override
  State<TravelOrdersPage> createState() => _TravelOrdersPageState();
}

class _TravelOrdersPageState extends State<TravelOrdersPage> {
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
          isTravelPage: true,
          firstButtonFunc: () {

          },
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
        const FilterContainer(
          isTravelPage: true,
        ),
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
            itemCount: getClientTripDetails()
                .length, //! changed + the provider will change
            itemBuilder: (context, index) {
              final order = getClientTripDetails()[index];
              return ClientTripDetailsContainer(
                isTravelPage: true,
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
