import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/login_prompt_page/customer_service_row_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/login_prompt_page/transport_row_widget.dart';

class LoginPromptPage extends StatelessWidget {
  const LoginPromptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(ispop: true),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringManager.loginPrompt,
                style: TextStyle(
                  fontSize: context.screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.08,
              ),
              const TransportRowWidget(),
              SizedBox(
                height: context.screenHeight * 0.08,
              ),
              const CustomerServiceRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
