import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/login_prompt_page/mode_of_transport_card_widget.dart';

class TransportRowWidget extends StatelessWidget {
  const TransportRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ModeOfTransportCardWidget(
          transportMode: StringManager.motorcycle,
        ),
        ModeOfTransportCardWidget(
          transportMode: StringManager.car,
        ),
      ],
    );
  }
}
