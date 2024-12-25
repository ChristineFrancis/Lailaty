import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class SecurityInformationPage extends StatelessWidget {
  const SecurityInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          StringManager.securityInformation,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorManager.yellowTextColor,
          ),
        ),
        backgroundColor: ColorManager.grey1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
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
