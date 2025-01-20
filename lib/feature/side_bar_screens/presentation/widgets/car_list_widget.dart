import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/state_managment/car_list_view_model.dart';
import 'package:provider/provider.dart';

class CarListWidget extends StatelessWidget {
  final void Function(
      BuildContext context, CarListViewModel viewModel, int index) onEdit;
  final double screenWidth;
  final double screenHeight;

  const CarListWidget({
    super.key,
    required this.onEdit,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CarListViewModel>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: screenWidth,
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            StringManager.myCars,
            style: StyleManager.boldTextStyle24(size: screenWidth * 0.05),
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            height: screenHeight * 0.19,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: viewModel.cars.length,
              itemBuilder: (context, index) {
                final car = viewModel.cars[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => onEdit(context, viewModel, index),
                            child: Row(
                              children: [
                                Text(
                                  StringManager.edit,
                                  style: StyleManager.boldTextStyle24(
                                    size: screenWidth * 0.05,
                                    color: ColorManager.black,
                                  ),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: ColorManager.black,
                                  size: screenWidth * 0.06,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => viewModel.deleteCar(index),
                            child: Row(
                              children: [
                                Text(
                                  StringManager.delete,
                                  style: StyleManager.boldTextStyle24(
                                    size: screenWidth * 0.05,
                                    color: ColorManager.black,
                                  ),
                                ),
                                Icon(
                                  Icons.delete_outline,
                                  color: ColorManager.black,
                                  size: screenWidth * 0.06,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        car.name.isEmpty ? StringManager.unknown : car.name,
                        style: StyleManager.boldTextStyle24(
                          size: screenWidth * 0.06,
                          color: ColorManager.black,
                        ),
                      ),
                      car.image != null
                          ? Image.file(
                              car.image!,
                              width: screenWidth * 0.3,
                              height: screenWidth * 0.3,
                              fit: BoxFit.cover,
                            )
                          : Icon(
                              Icons.image_outlined,
                              size: screenWidth * 0.3,
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.push(AppKeys.carInfoPath, extra: () {
                    context.pop();
                  });
                  //   final nameController = TextEditingController(); //!!
                  //   showDialog(
                  //     context: context,
                  //     builder: (_) => CarDialog(
                  //       nameController: nameController,
                  //       viewModel: viewModel,
                  //     ),
                  //   );
                },
                icon: Icon(
                  Icons.add_rounded,
                  color: ColorManager.black,
                  size: screenWidth * 0.1,
                ),
              ),
              Text(
                StringManager.addCar,
                style: StyleManager.boldTextStyle24(
                  size: screenWidth * 0.05,
                  color: ColorManager.black,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
        ],
      ),
    );
  }
}
