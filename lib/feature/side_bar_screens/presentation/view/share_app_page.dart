import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class ShareAppPage extends StatelessWidget {
  const ShareAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        title: StringManager.shareApp,
        ispop: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Center(
                child: Icon(
                  Icons.qr_code,
                  size: context.screenWidth * 0.5,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '1565S', //! get from the back ?
                    style: StyleManager.semiboldTextStyle20(
                        size: context.screenWidth * 0.05),
                  ),
                  SizedBox(
                    width: context.screenWidth * 0.02,
                  ),
                  Text(
                    StringManager.yourInvitationCode,
                    style: StyleManager.semiboldTextStyle20(
                        size: context.screenWidth * 0.05),
                  ),
                ],
              ),
              Divider(
                color: ColorManager.grey1,
                thickness: 2,
                endIndent: context.screenWidth * 0.08,
                indent: context.screenWidth * 0.08,
              ),
              SizedBox(
                height: context.screenHeight * 0.01,
              ),
              Text(
                StringManager.invitingDriverPartners,
                style: StyleManager.semiboldTextStyle20(
                    size: context.screenWidth * 0.05),
              ),
              Center(
                child: Text(
                  StringManager.driverPartnerBenefits,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.045,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringManager.fromEarnings,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: context.screenWidth * 0.05),
                  ),
                  Text(
                    StringManager.fivePercent,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: context.screenWidth * 0.05),
                  ),
                ],
              ),
              Divider(
                color: ColorManager.grey1,
                thickness: 2,
                endIndent: context.screenWidth * 0.08,
                indent: context.screenWidth * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ColorManager.grey1,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        StringManager.discountGiftForFriend,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: context.screenWidth * 0.04,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    StringManager.regardingClientInvitation,
                    style: StyleManager.semiboldTextStyle20(
                      size: context.screenWidth * 0.05,
                    ),
                  ),
                ],
              ),
              Center(
                child: Text(
                  StringManager.discountText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Center(
                child: Text(
                  StringManager.discountFromAppCommission,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: context.screenWidth * 0.035,
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              Center(
                child: Container(
                  width: context.screenWidth * 0.65,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.grey1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      StringManager.copyLink,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: context.screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              Center(
                child: Container(
                  width: context.screenWidth * 0.65,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.grey1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      StringManager.share,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: context.screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
