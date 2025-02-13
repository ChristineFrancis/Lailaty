import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/client_service_row.dart';
import 'package:lailaty/core/config/presentation/widget/form_profile_container.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class PersonFleetInformationWidget extends StatelessWidget {
  const PersonFleetInformationWidget({
    super.key,
    required this.context,
    required this.fleetNameController,
    required this.addressController,
  });

  final BuildContext context;
  final TextEditingController fleetNameController;
  final TextEditingController addressController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        Center(
          child: FormProfileContainer(
            controller: fleetNameController,
            title: StringManager.fleetName,
            hintText: '',
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        Center(
          child: FormProfileContainer(
            controller: addressController,
            title: StringManager.address,
            hintText: '',
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.4,
        ),
        const ClientServiceRow(),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        MyButton(
          title: StringManager.next,
          onpress: () {
            if (fleetNameController.text.isNotEmpty &&
                addressController.text.isNotEmpty) {
              //!navigate to the next page
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(StringManager.fleetValidate)),
              );
            }
          },
          colors: ColorManager.grey1,
          width: context.screenWidth * 0.7,
          height: context.screenHeight * 0.05,
          radius: 5,
          styleOfTExt: StyleManager.semiboldTextStyle20(),
        ),
      ],
    );
  }
}
