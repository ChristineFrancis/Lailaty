import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/presentation/widget/textWithExpansionTile.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import '../../../../../core/presentation/widget/accept_button_customer.dart';
import '../../../../../core/presentation/widget/custom_appbar.dart';
import '../../../../../core/resources/color_manager.dart';

class EditingCar extends StatefulWidget {
  final String initialOriginalCar;
  final String initialNewCar;
  final List<String> carOptions;

  const EditingCar({
    super.key,
    required this.initialOriginalCar,
    required this.initialNewCar,
    required this.carOptions,
  });

  @override
  State<EditingCar> createState() => _EditingCarState();
}

class _EditingCarState extends State<EditingCar> {
  late String selectedOriginalCar;
  late String selectedNewCar;

  @override
  void initState() {
    super.initState();
    selectedOriginalCar = widget.initialOriginalCar;
    selectedNewCar = widget.initialNewCar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: "معلومات السيارة",
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextWithExpansionTileSelector(
                  label: StringManager.typeOfCar,
                  selectedValue: selectedOriginalCar,
                  options: widget.carOptions,
                  onSelected: (value) =>
                      setState(() => selectedOriginalCar = value),
                ),
                TextWithExpansionTileSelector(
                  label: StringManager.editingCarToAnother,
                  selectedValue: selectedNewCar,
                  options: widget.carOptions,
                  onSelected: (value) => setState(() => selectedNewCar = value),
                ),
                const sizedBox50(),
                acceptButtonCustomer(
                  text: StringManager.tam,
                  onPress: () {
                    Navigator.pop(context, {
                      'original': selectedOriginalCar,
                      'new': selectedNewCar,
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
