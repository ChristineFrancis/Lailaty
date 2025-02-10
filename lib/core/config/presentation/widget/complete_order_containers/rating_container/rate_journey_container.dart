import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/bottom_sheet_handle.dart';
import 'package:lailaty/core/config/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/rating_container/rating_grid.dart';
import 'package:lailaty/core/config/presentation/widget/complete_order_containers/rating_container/stars_rating_widget.dart';

class RateJourneyContainer extends StatefulWidget {
  final VoidCallback toThePrivousPage;
  const RateJourneyContainer({
    super.key,
    required this.toThePrivousPage,
  });

  @override
  State<RateJourneyContainer> createState() => _RateJourneyContainerState();
}

class _RateJourneyContainerState extends State<RateJourneyContainer> {
  int _currentRating = 1;

  bool _isNoteFieldVisible = false;
  final TextEditingController _notesController = TextEditingController();

  void _onRatingChanged(int rating) {
    setState(() {
      _currentRating = rating;
    });
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey(AppKeys.rateJourneyContainer),
      //  height: context.screenHeight * 0.45,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
        color: ColorManager.grey1,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BottomSheetHandle(),
            StarsRatingWidget(onRatingChanged: _onRatingChanged),
            SizedBox(height: context.screenHeight * 0.02),
            RatingGrid(rating: _currentRating),
            _isNoteFieldVisible
                ? SizedBox(
                    width: context.screenWidth * 0.7,
                    height: context.screenHeight * 0.05,
                    child: TextField(
                      controller: _notesController,
                      textAlign: TextAlign.right,
                      cursorColor: ColorManager.grey1,
                      decoration: InputDecoration(
                        hintText: StringManager.writeYourNotesHere,
                        hintStyle: const TextStyle(color: ColorManager.grey1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: ColorManager.transparentColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: ColorManager.transparentColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: ColorManager.whiteColor),
                        ),
                        filled: true,
                        fillColor: ColorManager.whiteColor,
                      ),
                      maxLines: 1,
                    ),
                  )
                : MyButtonWidget(
                    width: context.screenWidth * 0.7,
                    height: context.screenHeight * 0.05,
                    radius: 5,
                    colors: ColorManager.whiteColor,
                    widget: Center(
                      child: Text(
                        StringManager.enterYourNotes,
                        style: StyleManager.boldTextStyle24(
                          size: context.screenHeight * 0.02,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onpress: () {
                      setState(() {
                        _isNoteFieldVisible = true;
                      });
                    },
                  ),
            SizedBox(height: context.screenHeight * 0.01),
            Center(
              child: MyButtonWidget(
                width: context.screenWidth * 0.7,
                height: context.screenHeight * 0.05,
                radius: 5,
                colors: ColorManager.yellowTextColor,
                widget: Center(
                  child: Text(
                    StringManager.send,
                    style: StyleManager.boldTextStyle24(
                      size: context.screenHeight * 0.03,
                    ),
                  ),
                ),
                onpress: widget.toThePrivousPage,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
