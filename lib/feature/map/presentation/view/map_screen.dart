import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/map/presentation/widgets/have_arrived_container.dart';
import 'package:lailaty/feature/map/presentation/widgets/journey_ended_container.dart';
import 'package:lailaty/feature/map/presentation/widgets/rate_journey_container.dart';

class MapPage extends StatefulWidget {
  final String initialContainerKey;

  const MapPage({
    super.key,
    required this.initialContainerKey,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with SingleTickerProviderStateMixin {
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
      appBar: CustomAppbar(ispop: false),
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

  Widget _getContainerForId(String containerId) {
    switch (containerId) {
      case AppKeys.iHaveArrivedContainer:
        return _buildIHaveArrivedContainer(
          () => _showContainer(AppKeys.startTheJourneyContainer),
        );
      case AppKeys.startTheJourneyContainer:
        return _buildstartTheJourneyContainer(
          () => _showContainer(AppKeys.journeyCompletedContainer),
        );

      case AppKeys.journeyCompletedContainer:
        return _buildJourneyCompletedContainer(
          () => _showContainer(AppKeys.journeyEndedContainer),
        );
      case AppKeys.journeyEndedContainer:
        return _buildJourneyEndedContainer(
          () => _showContainer(AppKeys.journeyCompletedContainer),
          () => _showContainer(AppKeys.rateJourneyContainer),
        );
      case AppKeys.rateJourneyContainer:
        return _buildRateJourneyContainer(() {
          context.pop();
        });
      default:
        return const SizedBox();
    }
  }

  Widget _buildIHaveArrivedContainer(VoidCallback haveArrived) {
    return HaveArrivedContainer(
      onTap: haveArrived,
      containerName: StringManager.iHaveArrived,
    );
  }

  Widget _buildstartTheJourneyContainer(VoidCallback toJourneyCompleted) {
    return HaveArrivedContainer(
      onTap: toJourneyCompleted,
      containerName: StringManager.startTheJourney,
    );
  }

  Widget _buildJourneyCompletedContainer(VoidCallback toJourneyEnded) {
    return HaveArrivedContainer(
      onTap: toJourneyEnded,
      containerName: StringManager.journeyCompleted,
    );
  }

  Widget _buildJourneyEndedContainer(
      VoidCallback toJourneyCompleted, VoidCallback toRateJourney) {
    return JourneyEndedContainer(
      toJourneyCompleted: toJourneyCompleted,
      toRateJourney: toRateJourney,
    );
  }

  Widget _buildRateJourneyContainer(VoidCallback toThePrivousPage) {
    return RateJourneyContainer(
      toThePrivousPage: toThePrivousPage,
    );
  }
}
