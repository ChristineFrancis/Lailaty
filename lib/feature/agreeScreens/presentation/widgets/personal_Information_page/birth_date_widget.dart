import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/birthdate_view_model.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/title_for_details_widget.dart';
import 'package:provider/provider.dart';

class BirthDateWidget extends StatefulWidget {
  const BirthDateWidget({super.key});

  @override
  State<BirthDateWidget> createState() => _BirthDateWidgetState();
}

class _BirthDateWidgetState extends State<BirthDateWidget> {
  @override
  Widget build(BuildContext context) {
    final birthDateViewModel = context.watch<DateviewModel>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: context.screenWidth,
      //height: context.screenHeight * 0.35,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: ColorManager.shadowColor,
          ),
        ),
      ),
      child: Column(
        children: [
          const TitleForDetailsWidget(
            title: StringManager.birthDate,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          GestureDetector(
            onTap: () => birthDateViewModel.pickDate(context),
            child: Container(
              width: context.screenWidth * 0.4,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.grey1,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    birthDateViewModel.formattedDate,
                    style: TextStyle(
                      color: birthDateViewModel.selectedDate != null
                          ? ColorManager.blackColor
                          : ColorManager.grey1,
                      fontSize: 16,
                    ),
                  ),
                  birthDateViewModel.selectedDate == null
                      ? const Icon(
                          Icons.touch_app,
                          color: ColorManager.grey1,
                        )
                      : Container()
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
        ],
      ),
    );
  }
}
