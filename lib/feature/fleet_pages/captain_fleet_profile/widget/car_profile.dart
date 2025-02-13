import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/accept_button_customer.dart';
import 'package:lailaty/core/config/presentation/widget/my_button_with_border.dart';
import 'package:lailaty/core/config/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';

class containerOfProfile extends StatelessWidget {
  String nameCar;
  String colorCar;
  String yearMade;
  String numberCar;
  void Function() onPressAccept;
  void Function() onPressRefuse;
  containerOfProfile({
    Key? key,
    required this.nameCar,
    required this.colorCar,
    required this.yearMade,
    required this.numberCar,
    required this.onPressAccept,
    required this.onPressRefuse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorManager.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InfoRow(label: StringManager.theCar, value: nameCar),
            InfoRow(label: StringManager.color, value: colorCar),
            InfoRow(label: StringManager.numberOfCars, value: numberCar),
            InfoRow(label: StringManager.yearMade, value: yearMade),
            sizedBox40(),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    acceptButtonCustomer(
                        width: MediaQuery.of(context).size.width / 3.5,
                        text: StringManager.accept,
                        onPress: () {}),
                    myButtonWithBorder(
                      width: MediaQuery.of(context).size.width / 3.5,
                      text: StringManager.refuse,
                      onpressed: () {},
                      colorBorder: ColorManager.black,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ويدجت لإظهار معلومات السيارة
class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
