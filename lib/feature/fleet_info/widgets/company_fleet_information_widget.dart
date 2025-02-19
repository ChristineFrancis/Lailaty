import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/client_service_row.dart';
import 'package:lailaty/core/config/presentation/widget/form_profile_container.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/image_picker_place_holder.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/no_image_placeholder_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/title_for_details_widget.dart';

class CompanyFleetInformationWidget extends StatelessWidget {
  final TextEditingController fleetNameController;
  final TextEditingController addressController;
  final File? selectedpostcardCopyImage;
  final File? selectedcommercialRegistrationImage;
  final PersonalInformationView viewModel;

  const CompanyFleetInformationWidget({
    super.key,
    required this.fleetNameController,
    required this.addressController,
    required this.selectedpostcardCopyImage,
    required this.selectedcommercialRegistrationImage,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: context.screenHeight * 0.02),
        Center(
          child: FormProfileContainer(
            controller: fleetNameController,
            title: StringManager.fleetName,
            hintText: '',
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Center(
          child: FormProfileContainer(
            controller: addressController,
            title: StringManager.address,
            hintText: '',
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        _buildImageSection(
          context,
          StringManager.commercialRegistration,
          selectedcommercialRegistrationImage,
          () async =>
              await viewModel.pickImage(AppKeys.commercialRegistrationImageKey),
        ),
        _buildImageSection(
          context,
          StringManager.postcardCopy,
          selectedpostcardCopyImage,
          () async => await viewModel.pickImage(AppKeys.postcardCopyImageKey),
        ),
        const ClientServiceRow(),
        SizedBox(height: context.screenHeight * 0.02),
        MyButton(
          title: StringManager.next,
          onpress: () {
            if (!viewModel.validateImagesInFleetInfoCompany(context)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(StringManager.uploadAllImages)),
              );
            } else if (fleetNameController.text.isEmpty &&
                addressController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text(
                  StringManager.fleetValidate,
                  textAlign: TextAlign.right,
                )),
              );
            } else {
              //! Navigate to the next page
            }
          },
          colors: ColorManager.grey1,
          width: context.screenWidth * 0.7,
          height: context.screenHeight * 0.05,
          radius: 5,
          styleOfTExt: StyleManager.semiboldTextStyle20(),
        ),
        SizedBox(height: context.screenHeight * 0.02),
      ],
    );
  }

  Widget _buildImageSection(
      BuildContext context, String title, File? imageFile, VoidCallback onTap) {
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
            noImgeWidget: const NoImagePlaceholderWidget(),
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3,
            hasImage: imageFile == null,
            imageFile: imageFile,
            onTap: onTap,
          ),
          SizedBox(height: context.screenHeight * 0.02),
        ],
      ),
    );
  }
}
