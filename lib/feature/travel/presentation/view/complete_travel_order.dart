import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/cancel_journey_container.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/rating_container/rate_journey_container.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/journey_ended_container.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/have_arrived_or_journey_completed_container.dart';

class CompleteTravelOrder extends StatefulWidget {
  final String initialContainerKey;

  const CompleteTravelOrder({
    super.key,
    required this.initialContainerKey,
  });

  @override
  State<CompleteTravelOrder> createState() => _CompleteTravelOrderState();
}

class _CompleteTravelOrderState extends State<CompleteTravelOrder>
    with SingleTickerProviderStateMixin {
  final bool justOnePath = false;

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
                      currentId == AppKeys.journeyEndedContainer)
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
                  : null,
            );
          },
        ),
      ),
      body: Stack(
        children: [
          // the map widget , better to extract it out of this page
          const Positioned.fill(
            child: Center(
              child: Text("Map Widget Here"),
            ),
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

//in travel :  jourenycompleted >> journey ended container >> rating <<and>>cancel
  Widget _getContainerForId(String containerId) {
    switch (containerId) {
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
