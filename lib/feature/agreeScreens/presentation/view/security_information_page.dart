import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/personal_information_view.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringManager.securityInformation,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorManager.black,
          ),
        ),
        backgroundColor: ColorManager.grey1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              color: ColorManager.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.1,
            child: Center(
              child: InkWell(
                onTap: () {
                  //!change this !!
                  context.push(AppKeys.loginPromptPageKey);
                },
                child: Container(
                  width: context.screenWidth * 0.8,
                  height: context.screenHeight * 0.05,
                  decoration: BoxDecoration(
                    color: ColorManager.grey1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      StringManager.next,
                      style: TextStyle(
                        color: ColorManager.yellowTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
