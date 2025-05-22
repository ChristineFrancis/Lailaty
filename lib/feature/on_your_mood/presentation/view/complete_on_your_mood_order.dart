import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/cancel_journey_container.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/rating_container/rate_journey_container.dart';
import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/journey_ended_container.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/have_arrived_or_journey_completed_container.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/request_to_teach_driving_and_on_your_mood_container.dart';
import 'package:lailaty/core/presentation/widget/complete_order_containers/while_waiting_for_teach_driving_and_on_your_mood_container.dart';
import 'package:lailaty/core/presentation/pages/map_page.dart';

class CompleteOnYourMoodOrder extends StatefulWidget {
  final String initialContainerKey;

  const CompleteOnYourMoodOrder({
    super.key,
    required this.initialContainerKey,
  });

  @override
  State<CompleteOnYourMoodOrder> createState() =>
      _CompleteOnYourMoodOrderState();
}

class _CompleteOnYourMoodOrderState extends State<CompleteOnYourMoodOrder>
    with SingleTickerProviderStateMixin {
  final bool justOnePath = true;
  final bool teachDrivingWidget = false;
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
          const Positioned.fill(child: MapWidget()),
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

  Widget _getContainerForId(String containerId) {
    switch (containerId) {
      case AppKeys.requestToTeachDrivingAndWithYourModeContainer:
        return _buildRequestToTeachDrivingAndWithYourModeContainer(
            () => context.pop(),
            () => _showContainer(AppKeys.whileWaitingForTeachDrivingAndOnYourMoodContainer));
      case AppKeys.whileWaitingForTeachDrivingAndOnYourMoodContainer:
        return _buildWhileWaitingContainerForTeachDrivingAndWithYourMode(
          () => _showContainer(AppKeys.iHaveArrivedContainer),
        );
      case AppKeys.iHaveArrivedContainer:
        return _buildIHaveArrivedContainer(
          () => _showContainer(AppKeys.startTheJourneyContainer),
          justOnePath,
        );
      case AppKeys.startTheJourneyContainer:
        return _buildstartTheJourneyContainer(
          () => _showContainer(AppKeys.journeyCompletedContainer),
          justOnePath,
        );

      case AppKeys.journeyCompletedContainer:
        return _buildJourneyCompletedContainer(
          () => _showContainer(AppKeys.journeyEndedContainer),
          justOnePath,
        );
      case AppKeys.journeyEndedContainer:
        return _buildJourneyEndedContainer(
          () => _showContainer(AppKeys.journeyCompletedContainer),
          () => _showContainer(AppKeys.rateJourneyContainer),
          justOnePath,
        );
      case AppKeys.rateJourneyContainer:
        return _buildRateJourneyContainer(() {
          context.pop();
        });
      case AppKeys.cancelJourneyContainer:
        return _buildCancelJourneyContainer(
          () => _showContainer(
            AppKeys.journeyCompletedContainer,
          ),
          () => context.pop(),
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildRequestToTeachDrivingAndWithYourModeContainer(
      VoidCallback toThePrivousPage, VoidCallback onAccepted) {
    return RequestToTeachDrivingAndWithYourModeContainer(
      toThePrivousPage: toThePrivousPage,
      onAccepted: onAccepted,
      teachDrivingWidget: teachDrivingWidget,
    );
  }

  Widget _buildWhileWaitingContainerForTeachDrivingAndWithYourMode(
      VoidCallback onAccepted) {
    return WhileWaitingForTeachDrivingAndOnYourMoodContainer(
      onAccepted: onAccepted,
      teachDrivingWidget: teachDrivingWidget,
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
}
