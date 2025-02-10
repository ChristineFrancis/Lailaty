import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/captain/captain_image_and_name_row.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/filter_container/filter_container.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/orders_overview_container.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/bottom_sheet_container.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/client_trip_details.dart';

class WiddingAndBusinessOrderPage extends StatefulWidget {
  const WiddingAndBusinessOrderPage({super.key});

  @override
  State<WiddingAndBusinessOrderPage> createState() =>
      _WiddingAndBusinessOrderPageState();
}

class _WiddingAndBusinessOrderPageState
    extends State<WiddingAndBusinessOrderPage> {
  void _showDetailsSheet(
      {required ClientTripDetailsModel clientTripDetailsModel}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetContainer(
          isTravelPage: false,
          firstButtonFunc: () {},
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
          isTravelPage: false,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: getClientTripDetails()
                .length,
            itemBuilder: (context, index) {
              final order = getClientTripDetails()[index];
              return ClientTripDetailsContainer(
                isTravelPage: false,
                widget: CaptianImageAndNameRow(captainName: order.captainName),
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
