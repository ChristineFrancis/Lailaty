import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/birth_date_widget.dart';
import 'package:lailaty/core/config/presentation/widget/client_service_row.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/driver_license_image_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/national_id_photo_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/next_botton_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/personal_image_widget.dart';

import 'package:lailaty/core/viewmodels/birthdate_view_model.dart';

import 'package:provider/provider.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PersonalInformationCubit>();
   final birthdateviewModel = context.watch<DateviewModel>();
    return Scaffold(
      appBar: CustomAppbar(
        ispop: false,
        title: StringManager.personalInformation,
      ),
      backgroundColor: ColorManager.backGroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PersonalImageWidget(
                    viewModel: viewModel,
                    sectionId: AppKeys.personalPhoto,
                  ),
                  NationalIdPhotoWidget(
                    viewModel: viewModel,
                    sectionIdFront: AppKeys.nationalIdFront,
                    sectionIdBack: AppKeys.nationalIdBack,
                  ),
                  DriverLicenseImageWidget(
                    viewModel: viewModel,
                    sectionIdFront: AppKeys.licenseFront,
                    sectionIdBack: AppKeys.licenseBack,
                  ),
                  // GoodConductCertificateWidget(
                  //   viewModel: viewModel,
                  //   sectionId: AppKeys.certificate,
                  // ),
                  const BirthDateWidget(),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  const ClientServiceRow(),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                ],
              ),
            ),
          ),
          NextBotton(
            onTap: () {
              if (
                  //!change this :
                  viewModel.getImage(AppKeys.licenseFront) != null &&
                      viewModel.getImage(AppKeys.licenseBack) != null &&
                      viewModel.getImage(AppKeys.nationalIdFront) != null &&
                      viewModel.getImage(AppKeys.nationalIdBack) != null &&
                      viewModel.getImage(AppKeys.personalPhoto) != null &&
                      //viewModel.validateImages(context) &&
                      birthdateviewModel.validateDate()) {
                context.push(AppKeys.securityInformationPageKey);
                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (context, animation, secondaryAnimation) =>
                //         const SecurityInformationPage(),
                //   ),
                // );
              } else {
                if ( //!viewModel.validateImages(context)
                    viewModel.getImage(AppKeys.licenseFront) == null ||
                        viewModel.getImage(AppKeys.licenseBack) == null ||
                        viewModel.getImage(AppKeys.nationalIdFront) == null ||
                        viewModel.getImage(AppKeys.nationalIdBack) == null ||
                        viewModel.getImage(AppKeys.personalPhoto) == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        StringManager.uploadAllImages,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                } else if (!birthdateviewModel.validateDate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        StringManager.selectBirthDate,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
