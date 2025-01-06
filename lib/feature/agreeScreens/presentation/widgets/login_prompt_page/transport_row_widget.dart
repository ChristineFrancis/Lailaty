import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/login_prompt_page/mode_of_transport_card_widget.dart';

import '../../../../../core/resources/key_manager.dart';

class TransportRowWidget extends StatelessWidget {
  const TransportRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ModeOfTransportCardWidget(
          transportMode: StringManager.motorcycle,
          image: ImageAssetManager.rideMotor,
          onTap: () {
            context.push(AppKeys.motorInfoPath);
          },
        ),
        ModeOfTransportCardWidget(
          transportMode: StringManager.car,
          image: ImageAssetManager.rideCar,
          onTap: () {
            context.push(AppKeys.carInfoPath);
          },
        ),
      ],
    );
  }
}
