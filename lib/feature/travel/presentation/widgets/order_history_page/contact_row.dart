import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';
import 'package:lailaty/feature/travel/presentation/widgets/orders_page/letter_circle.dart';

class ContactRow extends StatelessWidget {
  const ContactRow({
    super.key,
    required this.order,
  });

  final ClientTripDetailsModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //! change this to a choices?
        CircleAvatar(
          radius: context.screenWidth * 0.04,
          backgroundColor: ColorManager.yellowTextColor,
          child: const Icon(
            Icons.group, // change this with : FontAwesomeIcons.whatsapp
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
    );
  }
}
