import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CarSelectionDialog extends StatelessWidget {
  const CarSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
      backgroundColor: ColorManager.grey200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.only(
          left: 12, right: 12, top: screenHeight * 0.08, bottom: 12),
      title: Container(
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(1.0),
        ),
        padding: EdgeInsets.all(8.0), // Space between text and border
        child: CustomTextWidget(
            text: 'اختر الفئة السعرية المناسبة لرحلتك',
            fontSize: screenWidth * 0.045,
            color: Colors.black),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView(
          children: [
            carOption(
              context,
              title: "SUV",
              description: "Suitable for family trips or business.",
              price: "900",
              icon: Icons.directions_car,
            ),
            carOption(
              context,
              title: "Sedan",
              description: "Affordable and comfortable for travel.",
              price: "1400",
              icon: Icons.car_rental,
            ),
            carOption(
              context,
              title: "Luxury Car",
              description: "Elegant option for special occasions.",
              price: "4100",
              icon: Icons.directions_car_filled,
            ),
            carOption(
              context,
              title: "VIP",
              description: "For luxury and premium travel.",
              price: "2600",
              icon: Icons.star,
            ),
            carOption(
              context,
              title: "Mini Bus",
              description: "Ideal for group travel or families.",
              price: "1300",
              icon: Icons.airport_shuttle,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Close'),
        ),
      ],
    );
  }

  Widget carOption(BuildContext context,
      {required String title,
      required String description,
      required String price,
      required IconData icon}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40.0, color: Colors.yellow[800]),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(description, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Text(
            "\$$price",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
