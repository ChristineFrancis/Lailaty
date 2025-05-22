import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/rating_container/editable_button_field.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/captain/captain_image_and_name_row.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/bottom_sheet_container.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/client_trip_details.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/filter_container/filter_container.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/orders_overview_container.dart';

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

  final TextEditingController _textEditingController = TextEditingController();

  void _showDetailsSheet(
      {required ClientTripDetailsModel clientTripDetailsModel}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        bool isTextFieldVisible = false;
        return StatefulBuilder(builder: (context, setState) {
          return BottomSheetContainer(
            secondButtonWidget: EditableButtonField(
              hintText: '',
              initialText: StringManager.suggestYourPrice,
              buttonColor: ColorManager.whiteColor,
              textEditingController: _textEditingController,
              isTextFieldVisible: isTextFieldVisible,
              onToggle: (bool isVisible) {
                setState(() {
                  isTextFieldVisible = isVisible;
                });
              },
            ),
            isTravelPage: true,
            firstButtonFunc: () {},
            firstBottonText: StringManager.acceptAnOffer,
            secondBottonText: StringManager.suggestYourPrice,
            thirdBottonText: StringManager.viewOnMap,
            secondBottonColor: ColorManager.whiteColor,
            thirdBottonColor: ColorManager.yellowTextColor,
            clientTripDetailsModel: clientTripDetailsModel,
          );
        });
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // NoOrdersWidget(onRefresh: () {});
        Column(
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
