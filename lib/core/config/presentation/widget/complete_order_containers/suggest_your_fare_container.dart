import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class SuggestYourOwnFareContainer extends StatefulWidget {
  final VoidCallback toThePrivousPage;
  final VoidCallback suggest;
  const SuggestYourOwnFareContainer({
    super.key,
    required this.toThePrivousPage,
    required this.suggest,
  });

  @override
  State<SuggestYourOwnFareContainer> createState() =>
      _SuggestYourOwnFareContainerState();
}

class _SuggestYourOwnFareContainerState
    extends State<SuggestYourOwnFareContainer> {
  TextEditingController textEditingController = TextEditingController();
  String? errorMessage;

  void validateAndNavigate() {
    String enteredValue = textEditingController.text.trim();
    if (enteredValue.isEmpty) {
      setState(() {
        errorMessage = StringManager.pleaseEntertheSuggestedPrice;
      });
    } else {
      setState(() {
        errorMessage = null;
      });
      widget.suggest();
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.4,
      width: context.screenWidth,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: widget.toThePrivousPage,
                child: Container(
                  width: context.screenWidth * 0.08,
                  height: context.screenWidth * 0.08,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.yellowTextColor,
                  ),
                  child: Icon(
                    Icons.close,
                    size: context.screenWidth * 0.05,
                    color: ColorManager.grey1,
                  ),
                ),
              ),
            ),
            Text(
              StringManager.suggestYourFare,
              style: StyleManager.boldTextStyle24(
                size: context.screenWidth * 0.05,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            SizedBox(
              width: context.screenWidth * 0.4,
              child: TextField(
                controller: textEditingController,
                textAlign: TextAlign.right,
                cursorColor: ColorManager.grey1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: ColorManager.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: ColorManager.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: ColorManager.black),
                  ),
                  filled: true,
                  fillColor: ColorManager.whiteColor,
                ),
                maxLines: 1,
              ),
            ),
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  errorMessage!,
                  style: TextStyle(
                      color: ColorManager.errorColor,
                      fontSize: context.screenWidth * 0.03),
                ),
              ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Text(
              StringManager.suggestedPriceLimit,
              style: StyleManager.normalText18(
                color: ColorManager.black,
                size: context.screenWidth * 0.05,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            MyButtonWidget(
              width: context.screenWidth * 0.7,
              height: context.screenHeight * 0.05,
              radius: 5,
              colors: ColorManager.yellowTextColor,
              widget: Center(
                child: Text(
                  StringManager.submitOffer,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenHeight * 0.03,
                  ),
                ),
              ),
              onpress: validateAndNavigate,
            ),
          ],
        ),
      ),
    );
  }
}
