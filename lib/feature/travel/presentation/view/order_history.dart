import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/feature/travel/presentation/state_managment/filter_order_view_model.dart';
import 'package:lailaty/feature/travel/presentation/widgets/bottom_sheet_container.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/client_trip_details.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/letter_circle.dart';
import 'package:provider/provider.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  void _showDetailsSheet(
      {required ClientTripDetailsModel clientTripDetailsModel}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheetContainer(
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

  @override
  Widget build(BuildContext context) {
    final filterOrderViewModel = context.watch<FilterOrderViewModel>();
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
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //! change this to a choices?
                          CircleAvatar(
                            radius: context.screenWidth * 0.04,
                            backgroundColor: ColorManager.yellowTextColor,
                            child: const Icon(
                              Icons
                                  .group, // change this with : FontAwesomeIcons.whatsapp
                              color: ColorManager.cardColor,
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth * 0.02,
                          ),
                          CircleAvatar(
                            radius: context.screenWidth * 0.04,
                            backgroundColor: ColorManager.yellowTextColor,
                            child: const Icon(
                              Icons.message_outlined,
                              color: ColorManager.cardColor,
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth * 0.02,
                          ),
                          CircleAvatar(
                            radius: context.screenWidth * 0.04,
                            backgroundColor: ColorManager.yellowTextColor,
                            child: const Icon(
                              Icons.phone_outlined,
                              color: ColorManager.cardColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            order.captainName,
                            style: StyleManager.semiboldTextStyle20(
                              size: context.screenWidth * 0.05,
                            ),
                          ),
                          SizedBox(
                            width: context.screenWidth * 0.03,
                          ),
                          LetterCircle(
                            radius: context.screenWidth * 0.05,
                            letter: '',
                            backGroundColor: ColorManager.yellowTextColor,
                          ),
                        ],
                      ),
                      onTap: () {
                        if (filterOrderViewModel.currentFilter ==
                            StringManager.acceptedOrders) {
                          _showDetailsSheet(
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
