import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/bottom_sheet_container.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/client_trip_details.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/archived_order_bottom_sheet.dart';
import 'package:lailaty/core/viewmodels/filter_order_view_model.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/contact_row.dart';
import 'package:provider/provider.dart';

class WiddingAndBusinessHistoryPage extends StatefulWidget {
  const WiddingAndBusinessHistoryPage({super.key});

  @override
  State<WiddingAndBusinessHistoryPage> createState() =>
      _WiddingAndBusinessHistoryPageState();
}

class _WiddingAndBusinessHistoryPageState
    extends State<WiddingAndBusinessHistoryPage> {
  void _showDetailsSheetForAcceptedOrders(
      {required ClientTripDetailsModel clientTripDetailsModel}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetContainer(
          isTravelPage: false,
          firstBottonText: StringManager.completeTheOrder,
          secondBottonText: StringManager.viewOnMap,
          thirdBottonText: StringManager.orderCancellation,
          secondBottonColor: ColorManager.yellowTextColor,
          thirdBottonColor: ColorManager.transparentColor,
          clientTripDetailsModel: clientTripDetailsModel,
        );
      },
    );
  }

  void _showDetailsSheetForArchivedOrders(
      {required ClientTripDetailsModel clientTripDetailsModel}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ArchivedOrderBottomSheet(
          isTravelPage: false,
          clientTripDetailsModel: clientTripDetailsModel,
          firstBottonText: StringManager.obtainingAReceipt,
          secondBottonText: StringManager.ratingThePassenger,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filterOrderViewModel =
        context.watch<FilterOrderViewModel>(); //! change
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildFilterButton(
                context: context,
                title: StringManager.archivedOrders,
                filter: StringManager.archivedOrders,
                isActive: filterOrderViewModel.currentFilter ==
                    StringManager.archivedOrders,
              ),
              _buildFilterButton(
                context: context,
                title: StringManager.acceptedOrders,
                filter: StringManager.acceptedOrders,
                isActive: filterOrderViewModel.currentFilter ==
                    StringManager.acceptedOrders,
              ),
              _buildFilterButton(
                context: context,
                title: StringManager.onHoldOrders,
                filter: StringManager.onHoldOrders,
                isActive: filterOrderViewModel.currentFilter ==
                    StringManager.onHoldOrders,
              ),
            ],
          ),
        ),
        Expanded(
          child: filterOrderViewModel.filteredOrders.isEmpty
              ? const Center(
                  child: Text(
                    StringManager.noOrdersFound,
                  ),
                )
              : ListView.builder(
                  itemCount: filterOrderViewModel.filteredOrders.length,
                  itemBuilder: (context, index) {
                    final order = filterOrderViewModel.filteredOrders[index];
                    return ClientTripDetailsContainer(

                      isTravelPage: false,
                      widget: ContactRow(order: order),
                      onTap: () {
                        if (filterOrderViewModel.currentFilter ==
                            StringManager.acceptedOrders) {
                          _showDetailsSheetForAcceptedOrders(
                            clientTripDetailsModel:
                                getClientTripDetails()[index],
                          );
                        }
                        if (filterOrderViewModel.currentFilter ==
                            StringManager.archivedOrders) {
                          _showDetailsSheetForArchivedOrders(
                            clientTripDetailsModel:
                                getClientTripDetails()[index],
                          );
                        }
                      },
                      clientTripDetailsModel: order,
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildFilterButton({
    required BuildContext context,
    required String title,
    required String filter,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<FilterOrderViewModel>().updateFilter(filter);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isActive
              ? ColorManager.yellowTextColor
              : ColorManager.yellowTextColor.withAlpha((0.5 * 255).toInt()),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive
                ? ColorManager.black
                : ColorManager.black.withAlpha((0.6 * 255).toInt()),
          ),
        ),
      ),
    );
  }
}
