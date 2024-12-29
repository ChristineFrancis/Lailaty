import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/login_prompt_page/customer_service_row_widget.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/login_prompt_page/transport_row_widget.dart';

class LoginPromptPage extends StatelessWidget {
  const LoginPromptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: AppBar(
        backgroundColor: ColorManager.grey1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
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
