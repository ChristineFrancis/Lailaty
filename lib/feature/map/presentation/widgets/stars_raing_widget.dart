import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class StarsRatingWidget extends StatefulWidget {
  final void Function(int) onRatingChanged;

  const StarsRatingWidget({super.key, required this.onRatingChanged});

  @override
  State<StarsRatingWidget> createState() => _StarsRatingWidgetState();
}

class _StarsRatingWidgetState extends State<StarsRatingWidget> {
  int _rating = 1;

  final List<String> _ratingTexts = [
    StringManager.veryBad,
    StringManager.bad,
    StringManager.average,
    StringManager.good,
    StringManager.veryGood,
  ];

  void _updateRating(int rating) {
    if (rating >= 1 && rating <= 5) {
      setState(() {
        _rating = rating;
      });
      widget.onRatingChanged(rating);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.screenHeight * 0.02),
        Text(
          _rating > 0 && _rating <= 5 ? _ratingTexts[_rating - 1] : "",
          style: StyleManager.boldTextStyle24(
            size: context.screenWidth * 0.08,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final reversedIndex = 4 - index;
            final isActive = reversedIndex < _rating;
            return IconButton(
              icon: Icon(
                Icons.star_outline,
                size: context.screenWidth * 0.1,
                color: isActive
                    ? ColorManager.yellowTextColor
                    : ColorManager.greyStartRating,
              ),
              onPressed: () => _updateRating(reversedIndex + 1),
            );
          }),
        ),
      ],
    );
  }
}
