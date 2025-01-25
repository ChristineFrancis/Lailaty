import 'package:flutter/widgets.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class RatingGrid extends StatelessWidget {
  final int rating;

  const RatingGrid({super.key, required this.rating});

  List<String> _getContentForRating(int rating) {
    switch (rating) {
      case 5:
        return [
          "تفاصيل الرحلة غير موجودة",
          "عنوان غير دقيق",
          "لم يدفع",
          "إساءة التعامل مع المركبة",
          "دفع مبلغ اقل",
          "راكب متناقض",
          "تجاوزت مدة الانتظار",
        ];
      case 1:
        return [
          "سيارة لطيفة",
          "سائق مؤدب",
          "السائق وصل بسرعة",
          "قيادة حذرة",
          "نظيف وانيق",
          "موسيقى جيدة",
        ];
      default:
        return ["Default Item 1", "Default Item 2"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = _getContentForRating(rating);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3.5,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: ColorManager.greyRateContainer,
            ),
            child: Center(
              child: Text(
                items[index],
                textAlign: TextAlign.center,
                // overflow: TextOverflow.ellipsis,
                style: StyleManager.boldTextStyle24(
                  size: context.screenWidth * 0.028,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
