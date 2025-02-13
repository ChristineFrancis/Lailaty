import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/suggest_your_fare_container.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/confirm_suggested_price_container.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/while_waiting_container.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/your_offer_was_not_accepted_container.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/cancel_journey_container.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/have_arrived_or_journey_completed_container.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/journey_ended_container.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/rating_container/rate_journey_container.dart';
import 'package:lailaty/core/config/presentation/pages/map_page.dart';
import 'package:lailaty/feature/inland_transportation/presentation/widgets/select_destination_container.dart';

class InlandTransportationCompleteOrder extends StatefulWidget {
  final String initialContainerKey;
  final bool justOnePath;
  const InlandTransportationCompleteOrder({
    super.key,
    required this.initialContainerKey,
    this.justOnePath = false,
  });

  @override
  State<InlandTransportationCompleteOrder> createState() =>
      _InlandTransportationCompleteOrderState();
}

class _InlandTransportationCompleteOrderState
    extends State<InlandTransportationCompleteOrder>
    with SingleTickerProviderStateMixin {
  late final ValueNotifier<String> _currentContainerId;
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _currentContainerId = ValueNotifier(widget.initialContainerKey);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _currentContainerId.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _showContainer(String containerId) async {
    await _animationController.reverse();

    _currentContainerId.value = containerId;

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ValueListenableBuilder<String>(
          valueListenable: _currentContainerId,
          builder: (context, currentId, child) {
            return CustomAppbar(
              ispop: false,
              leading: (currentId == AppKeys.journeyCompletedContainer ||
                      currentId == AppKeys.journeyEndedContainer ||
                      currentId == AppKeys.iHaveArrivedContainer ||
                      currentId == AppKeys.startTheJourneyContainer)
                  ? InkWell(
                      onTap: () {
                        // _currentContainerId.value =
                        //     AppKeys.cancelJourneyContainer;
                        _showContainer(AppKeys.cancelJourneyContainer);
                      },
                      child: Center(
                        child: Text(
                          StringManager.cancel,
                          style: StyleManager.semiboldTextStyle20(
                            size: context.screenWidth * 0.05,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // the map widget , better to extract it out of this page
          const Positioned.fill(
            child: MapWidget(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder<String>(
              valueListenable: _currentContainerId,
              builder: (context, currentId, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _getContainerForId(currentId),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

//trip and luxury have the same senario but without the price changed option
  Widget _getContainerForId(String containerId) {
    switch (containerId) {
      case AppKeys.confirmSuggestedPriceForLuxuryContainer:
        return _buildConfirmSuggestedPriceForLuxuryContainer(
          () => context.pop(),
          () => _showContainer(AppKeys.whileWaitingContainer),
          () => _showContainer(AppKeys.suggestYourFare),
        );

      case AppKeys.confirmSuggestedPriceForTripAndRideContainer:
        return _buildConfirmSuggestedPriceForTripAndRideContainer(
            () => context.pop(),
            () => _showContainer(AppKeys.whileWaitingContainer),
            () => _showContainer(AppKeys.suggestYourFare));

      case AppKeys.suggestYourFare:
        return _buildSuggestYourFareContainer(
          () => _showContainer(
              AppKeys.confirmSuggestedPriceForTripAndRideContainer),
          () => _showContainer(AppKeys.whileWaitingContainer),
        );

      case AppKeys.whileWaitingContainer:
        return _buildWhileWaitingContainer(
            () => _showContainer(AppKeys.iHaveArrivedContainer),
            () => _showContainer(AppKeys.yourOfferWasNotAcceptedContainer));
      case AppKeys.iHaveArrivedContainer:
        return _buildIHaveArrivedContainer(
          () => _showContainer(AppKeys.startTheJourneyContainer),
          widget.justOnePath,
        );
      case AppKeys.startTheJourneyContainer:
        return _buildstartTheJourneyContainer(
          () => _showContainer(AppKeys.journeyCompletedContainer),
          widget.justOnePath,
        );
      case AppKeys.journeyCompletedContainer:
        return _buildJourneyCompletedContainer(
          () => _showContainer(AppKeys.journeyEndedContainer),
          widget.justOnePath,
        );
      case AppKeys.journeyEndedContainer:
        return _buildJourneyEndedContainer(
          () => _showContainer(AppKeys.journeyCompletedContainer),
          () => _showContainer(AppKeys.rateJourneyContainer),
          widget.justOnePath,
        );
      case AppKeys.rateJourneyContainer:
        return _buildRateJourneyContainer(() {
          context.pop();
        });
      case AppKeys.cancelJourneyContainer:
        return _buildCancelJourneyContainer(
          () => _showContainer(
              AppKeys.journeyCompletedContainer), //! where this going to go ?
          () => context.pop(),
        );

      case AppKeys.yourOfferWasNotAcceptedContainer:
        return _buildYourOfferWasNotAcceptedContainer(
          () => context.pop(),
          () => _showContainer(AppKeys.whileWaitingContainer),
        );

      case AppKeys.selectDestinationContainerKey:
        return _buildSelectDestinationContainer(
            () => _showContainer(AppKeys.journeyCompletedContainer));
      default:
        return const SizedBox();
    }
  }

  Widget _buildConfirmSuggestedPriceForTripAndRideContainer(
      VoidCallback toThePrivousPage,
      VoidCallback onAccepted,
      VoidCallback toSuggestYourFare) {
    return ConfirmSuggestedPriceContainer(
      toSuggestYourFare: toSuggestYourFare,
      toThePrivousPage: toThePrivousPage,
      onAccepted: onAccepted,
      priceOptions: true,
      //teachDrivingWidget: false, if its onMode : false
    );
  }

  Widget _buildConfirmSuggestedPriceForLuxuryContainer(
      VoidCallback toThePrivousPage,
      VoidCallback onAccepted,
      VoidCallback toSuggestYourFare) {
    return ConfirmSuggestedPriceContainer(
      toSuggestYourFare: toSuggestYourFare,
      toThePrivousPage: toThePrivousPage,
      onAccepted: onAccepted,
      priceOptions: false,
      //teachDrivingWidget: false, if its onMode : false
    );
  }

  Widget _buildSuggestYourFareContainer(
      VoidCallback toThePrivousPage, VoidCallback suggest) {
    return SuggestYourOwnFareContainer(
      toThePrivousPage: toThePrivousPage,
      suggest: suggest,
    );
  }

  Widget _buildIHaveArrivedContainer(
      VoidCallback haveArrived, bool justOnePath) {
    return HaveArrivedOrJourneyCompletedContainer(
      onTap: haveArrived,
      containerName: StringManager.iHaveArrived,
      justOnePath: justOnePath,
    );
  }

  Widget _buildstartTheJourneyContainer(
      VoidCallback toJourneyCompleted, bool justOnePath) {
    return HaveArrivedOrJourneyCompletedContainer(
      onTap: toJourneyCompleted,
      containerName: StringManager.startTheJourney,
      justOnePath: justOnePath,
    );
  }

  Widget _buildJourneyCompletedContainer(
      VoidCallback toJourneyEnded, bool justOnePath) {
    return HaveArrivedOrJourneyCompletedContainer(
      onTap: toJourneyEnded,
      containerName: StringManager.journeyCompleted,
      justOnePath: justOnePath,
    );
  }

  Widget _buildJourneyEndedContainer(VoidCallback toJourneyCompleted,
      VoidCallback toRateJourney, bool justOnePath) {
    return JourneyEndedContainer(
      toJourneyCompleted: toJourneyCompleted,
      toRateJourney: toRateJourney,
      justOnePath: justOnePath,
    );
  }

  Widget _buildRateJourneyContainer(VoidCallback toThePrivousPage) {
    return RateJourneyContainer(
      toThePrivousPage: toThePrivousPage,
    );
  }

  Widget _buildCancelJourneyContainer(
      VoidCallback toThePrivousPage, VoidCallback onChooseCancellationReason) {
    return CancelJourneyContainer(
      onClose: toThePrivousPage,
      onChooseCancellationReason: onChooseCancellationReason,
    );
  }

  Widget _buildWhileWaitingContainer(
      VoidCallback onAccepted, VoidCallback refuse) {
    return WhileWaitingContainer(
      onAccepted: onAccepted,
      onRefuse: refuse,
      //  teachDrivingWidget: false ,
    );
  }

  Widget _buildYourOfferWasNotAcceptedContainer(
      VoidCallback onClose, VoidCallback whenChoosing) {
    return YourOfferWasNotAcceptedContainer(
      onClose: onClose,
      whenChoosing: whenChoosing,
    );
  }

  Widget _buildSelectDestinationContainer(VoidCallback toJourneyCompleted) {
    return SelectDestinationContainer(
      toJourneyCompleted: toJourneyCompleted,
    );
  }
}
