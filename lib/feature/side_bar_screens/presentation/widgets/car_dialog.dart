import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/side_bar_screens/data/car_info.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/state_managment/car_list_view_model.dart';

class CarDialog extends StatefulWidget {
  const CarDialog({
    super.key,
    required this.nameController,
    this.car,
    required this.viewModel,
    this.index,
  });

  final TextEditingController nameController;
  final CarInfo? car;
  final CarListViewModel viewModel;
  final int? index;

  @override
  State<CarDialog> createState() => _CarDialogState();
}

class _CarDialogState extends State<CarDialog> {
  File? _tempImage;

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.car != null;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: ColorManager.grey1,
        title: Text(
          isEditing ? StringManager.edit : StringManager.addANewCar,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: widget.nameController,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                labelText: StringManager.carName,
                labelStyle: TextStyle(
                  color: ColorManager.blackColor,
                  fontSize: context.screenWidth * 0.05,
                ),
                filled: true,
                fillColor: Colors.transparent,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.blackColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.blackColor,
                    width: 2.0,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.blackColor,
                    width: 1.5,
                  ),
                ),
              ),
              cursorColor: ColorManager.blackColor,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Center(
              child: InkWell(
                onTap: () async {
                  final File? newImage = await widget.viewModel.pickImage();
                  if (newImage != null) {
                    setState(() {
                      _tempImage = newImage;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManager.blackColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.image,
                        color: ColorManager.backGroundColor,
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.01,
                      ),
                      Text(
                        _tempImage != null
                            ? StringManager.newImageSelected
                            : isEditing
                                ? StringManager.editImage
                                : StringManager.addANewCar,
                        style: const TextStyle(
                          color: ColorManager.backGroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (isEditing) {
                widget.viewModel.editCar(
                  widget.index!,
                  name: widget.nameController.text,
                  image: _tempImage,
                );
              } else {
                widget.viewModel.addCar(
                  name: widget.nameController.text,
                  image: _tempImage,
                );
              }
              context.pop();
            },
            child: const Text(
              StringManager.save,
              style: TextStyle(color: ColorManager.blackColor),
            ),
          ),
          TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              StringManager.cancel,
              style: TextStyle(color: ColorManager.blackColor),
            ),
          ),
        ],
      ),
    );
  }
}
