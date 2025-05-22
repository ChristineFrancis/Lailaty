import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/presentation/widget/client_service_row.dart';
import 'package:lailaty/core/presentation/widget/form_profile_container.dart';
import 'package:lailaty/core/presentation/widget/myButton.dart';
import 'package:lailaty/core/presentation/widget/offline_dialog_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/state_managments/network_bloc/net_work_bloc.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_request.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/personal_fleet/personal_fleet_bloc.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_infromation_widget/fleet_address.dart';

class PersonFleetInformationWidget extends StatefulWidget {
  const PersonFleetInformationWidget({
    super.key,
    required this.context,
    required this.fleetNameController,
    required this.addressController,
    required this.personPhoneNumberController,
  });

  final BuildContext context;
  final TextEditingController fleetNameController;
  final TextEditingController addressController;
  final TextEditingController personPhoneNumberController;

  @override
  State<PersonFleetInformationWidget> createState() =>
      _PersonFleetInformationWidgetState();
}

class _PersonFleetInformationWidgetState
    extends State<PersonFleetInformationWidget> {
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        Center(
          child: FormProfileContainer(
            controller: widget.fleetNameController,
            title: StringManager.fleetName,
            hintText: '',
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        Center(
          child: FleetAddressContainer(
            onLocationSelected: (lat, lng) {
              setState(() {
                latitude = lat;
                longitude = lng;
              });
              print("Selected Latitude: $lat, Longitude: $lng");
            },
            controller: widget.addressController,
            title: StringManager.address,
            hintText: '',
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        Center(
          child: FormProfileContainer(
            controller: widget.personPhoneNumberController,
            title: StringManager.phoneNumber,
            hintText: '',
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.2,
        ),
        const ClientServiceRow(),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
        BlocBuilder<PersonalFleetBloc, PersonalFleetState>(
          builder: (context, state) {
            if (state is PersonalFleetLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.grey1,
                ),
              );
            }
            return MyButton(
              title: StringManager.next,
              onpress: () {
                _validateAndSubmit(context);
              },
              colors: ColorManager.grey1,
              width: context.screenWidth * 0.7,
              height: context.screenHeight * 0.05,
              radius: 5,
              styleOfTExt: StyleManager.semiboldTextStyle20(),
            );
          },
        ),
        SizedBox(
          height: context.screenHeight * 0.02,
        ),
      ],
    );
  }

  void _validateAndSubmit(BuildContext context) {
    if (widget.fleetNameController.text.isEmpty ||
        widget.addressController.text.isEmpty ||
        widget.addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            StringManager.fleetValidate,
            textAlign: TextAlign.right,
          ),
        ),
      );
      return;
      //!navigate to the next page
      //  context.push(AppKeys.fleetOptionsPage);
    }
    if (latitude == null || longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "يرجى تحديد الموقع قبل المتابعة.",
            textAlign: TextAlign.right,
          ),
        ),
      );
      return;
    }

    final networkState = context.read<NetWorkBloc>().state;
    if (networkState is NetWorkOffline) {
      showDialog(
        context: context,
        builder: (context) {
          return const OfflineDialogWidget();
        },
      );
      return;
    }

    final request = FleetCreatePersonRequest(
      latitude: latitude!,
      longitude: longitude!,
      phoneNumber: widget.personPhoneNumberController.text,
      name: widget.fleetNameController.text,
    );

    context.read<PersonalFleetBloc>().add(SubmitPersonalFleet(request));
  }
}
