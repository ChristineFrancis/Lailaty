import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_infromation_widget/company_fleet_information_widget.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_infromation_widget/person_fleet_information_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/fleet_infromation_widget/company_fleet_information_widget.dart';
import '../widgets/fleet_infromation_widget/person_fleet_information_widget.dart';

class FleetInfromationPage extends StatefulWidget {
  const FleetInfromationPage({super.key});

  @override
  State<FleetInfromationPage> createState() => _FleetInfromationPageState();
}

class _FleetInfromationPageState extends State<FleetInfromationPage> {
  int selectedIndex = 1;

  TextEditingController companyFleetNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController personFleetNameController = TextEditingController();
  TextEditingController personAddressController = TextEditingController();

  FocusNode _companyFocusNode = FocusNode();
  FocusNode _personFocusNode = FocusNode();

  @override
  void dispose() {
    if (_companyFocusNode.hasFocus) companyFleetNameController.dispose();
    if (_companyFocusNode.hasFocus) companyAddressController.dispose();
    if (_personFocusNode.hasFocus) personFleetNameController.dispose();
    if (_personFocusNode.hasFocus) personAddressController.dispose();

    _companyFocusNode.dispose();
    _personFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PersonalInformationCubit>();
    final selectedpostcardCopyImage =
        viewModel.getImage(AppKeys.postcardCopyImageKey);
    final selectedcommercialRegistrationImage =
        viewModel.getImage(AppKeys.commercialRegistrationImageKey);

    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: false,
        title: StringManager.fleetInformation,
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSelectableContainer(0, StringManager.person),
              SizedBox(
                width: context.screenWidth * 0.02,
              ),
              _buildSelectableContainer(1, StringManager.company),
            ],
          ),
          Expanded(
              child: _buildDynamicContent(selectedpostcardCopyImage,
                  selectedcommercialRegistrationImage, viewModel)),
        ],
      ),
    );
  }

  Widget _buildSelectableContainer(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: context.screenHeight * 0.05,
        width: context.screenWidth * 0.3,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? ColorManager.grey1
              : ColorManager.backGroundColor,
          border: Border.all(color: ColorManager.grey1, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: context.screenHeight * 0.025,
            color: selectedIndex == index
                ? ColorManager.whiteColor
                : ColorManager.black,
            //  fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDynamicContent(
      File? selectedpostcardCopyImage,
      File? selectedcommercialRegistrationImage,
      PersonalInformationCubit viewModel) {
    if (selectedIndex == 0) {
      return PersonFleetInformationWidget(
        context: context,
        fleetNameController: personFleetNameController,
        addressController: personAddressController,
      );
    } else {
      return CompanyFleetInformationWidget(
        fleetNameController: companyFleetNameController,
        addressController: companyAddressController,
        selectedpostcardCopyImage: selectedpostcardCopyImage,
        selectedcommercialRegistrationImage:
            selectedcommercialRegistrationImage,
        viewModel: viewModel,
      );
    }
  }
}
