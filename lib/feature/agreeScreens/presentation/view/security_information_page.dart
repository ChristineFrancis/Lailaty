import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/client_service_row.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/details_text_widget.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/next_botton_widget.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/title_for_details_widget.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/security_information_page/good_conduct_certificate.dart';
import 'package:provider/provider.dart';

class SecurityInformationPage extends StatelessWidget {
  const SecurityInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const sectionId = AppKeys.certificate;
    final viewModel = context.watch<PersonalInformationView>();
    final selectedImage = viewModel.getImage(sectionId);

    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.securityInformation,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GoodConductCertificateContainer(
              selectedImage: selectedImage,
              viewModel: viewModel,
              sectionId: sectionId,
            ),
            const TitleForDetailsWidget(
              title: StringManager.declarationAndCommitment,
            ),
            Text(
              StringManager.ensureAppSafetyMessage,
              style: TextStyle(
                fontSize: context.screenWidth * 0.04,
                fontWeight: FontWeight.w500,
                color: ColorManager.black,
              ),
            ),
            Text(
              StringManager.goodConductCertificateMessage,
              style: TextStyle(
                fontSize: context.screenWidth * 0.04,
                fontWeight: FontWeight.w500,
                color: ColorManager.black,
              ),
            ),
            const DetailsText(
              text: StringManager.agreeAndCommitMessage,
            ),
            const DetailsText(
              text: StringManager.certificateRequiredMessage,
            ),
            const DetailsText(
              text: StringManager.delayWillSuspendAccountMessage,
            ),
            SizedBox(
              height: context.screenHeight * 0.1,
            ),
            const ClientServiceRow(),
            SizedBox(
              height: context.screenHeight * 0.1,
            ),
            NextBotton(
              onTap: () {
                context.push(AppKeys.loginPromptPageKey);
              },
            ),
          ],
        ),
      ),
    );
  }
}
