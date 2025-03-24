import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/config/presentation/widget/client_service_row.dart';
import 'package:lailaty/core/config/presentation/widget/form_profile_container.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/config/presentation/widget/offline_dialog_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/core/state_managments/network_bloc/net_work_bloc.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/image_picker_place_holder.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/no_image_placeholder_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/title_for_details_widget.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_create_company_request_entity.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/fleet_company/fleet_company_bloc.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_infromation_widget/fleet_address.dart';
import 'package:provider/provider.dart';

class CompanyFleetInformationWidget extends StatefulWidget {
  final TextEditingController fleetNameController;
  final TextEditingController addressController;
  final File? selectedpostcardCopyImage;
  final File? selectedcommercialRegistrationImage;
  final PersonalInformationCubit viewModel;
  final TextEditingController companyPhoneNumberController;

  const CompanyFleetInformationWidget({
    super.key,
    required this.fleetNameController,
    required this.addressController,
    required this.selectedpostcardCopyImage,
    required this.selectedcommercialRegistrationImage,
    required this.viewModel,
    required this.companyPhoneNumberController,
  });

  @override
  _CompanyFleetInformationWidgetState createState() =>
      _CompanyFleetInformationWidgetState();
}

class _CompanyFleetInformationWidgetState
    extends State<CompanyFleetInformationWidget> {
  double? latitude;
  double? longitude;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: context.screenHeight * 0.02),
        Center(
          child: FormProfileContainer(
            controller: widget.fleetNameController,
            title: StringManager.fleetName,
            hintText: '',
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
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
        SizedBox(height: context.screenHeight * 0.02),
        Center(
          child: FormProfileContainer(
            controller: widget.companyPhoneNumberController,
            title: StringManager.phoneNumber,
            hintText: '',
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        _buildImageSection(context, StringManager.commercialRegistration,
            AppKeys.commercialRegistrationImageKey),
        _buildImageSection(
            context, StringManager.postcardCopy, AppKeys.postcardCopyImageKey),
        const ClientServiceRow(),
        SizedBox(height: context.screenHeight * 0.02),
        BlocBuilder<FleetCompanyBloc, FleetCompanyState>(
          builder: (context, state) {
            if (state is FleetCompanyLoading) {
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
        SizedBox(height: context.screenHeight * 0.02),
      ],
    );
  }

  void _validateAndSubmit(BuildContext context) {
    if (widget.viewModel.getImage(AppKeys.commercialRegistrationImageKey) ==
            null ||
        widget.viewModel.getImage(AppKeys.postcardCopyImageKey) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            StringManager.uploadAllImages,
            textAlign: TextAlign.right,
          ),
        ),
      );
      return;
    }

    if (widget.addressController.text.isEmpty ||
        widget.fleetNameController.text.isEmpty ||
        widget.companyPhoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            StringManager.fleetValidate,
            textAlign: TextAlign.right,
          ),
        ),
      );
      return;
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

    final request = FleetCreateCompanyRequestEntity(
      latitude: latitude!,
      longitude: longitude!,
      phoneNumber: widget.companyPhoneNumberController.text,
      commercialRegistrationCard:
          widget.viewModel.getImage(AppKeys.commercialRegistrationImageKey)!,
      taxCard: widget.viewModel.getImage(AppKeys.postcardCopyImageKey)!,
      name: widget.fleetNameController.text,
    );

    context.read<FleetCompanyBloc>().add(SubmitFleetCompany(request));
  }

  Widget _buildImageSection(
      BuildContext context, String title, String imageKey) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: context.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(width: 2, color: ColorManager.shadowColor),
        ),
      ),
      child: Column(
        children: [
          TitleForDetailsWidget(title: title),
          SizedBox(height: context.screenHeight * 0.02),
          ImagePickerPlaceHolder(
            noImageWidget: const NoImagePlaceholderWidget(),
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3,
            imageKey: imageKey,
            onImageSelected: (key, image) {
              widget.viewModel.updateImage(key, image);
            },
          ),
          SizedBox(height: context.screenHeight * 0.02),
        ],
      ),
    );
  }
}
