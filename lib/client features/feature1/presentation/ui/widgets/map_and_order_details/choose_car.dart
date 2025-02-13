import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/car_details_bottom_sheet.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

/*
class CarSelection extends StatefulWidget {
  final List <CarType> carsType;

  const CarSelection({super.key, required this.carsType});
  @override
  _CarSelectionState createState() => _CarSelectionState();
}

class _CarSelectionState extends State<CarSelection> {
  int selectedIndex = 0; 
  @override
  Widget build(BuildContext context) {
    final sizeOfScreen=MediaQuery.sizeOf(context).height;
    final widthOfScreen=MediaQuery.sizeOf(context).width;

    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      height: sizeOfScreen/8.6,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.carsType.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(width: 13,),
              InkWell(
  onTap: () {
    setState(() {
      selectedIndex = index;
    });
  },
  child: Container(
    height: sizeOfScreen / 8.7,
    width: widthOfScreen / 4.8,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: selectedIndex == index
          ? ColorManager.yellow.withOpacity(1.0) // Full brightness for selected
          : ColorManager.yellow.withOpacity(0.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4), // Slight shadow
          blurRadius: 6, // Soft blur effect
          offset: Offset(0, 7),
        ),
      ], // Dimmed for unselected
    ),
    child: Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 2 , left: 5),
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.error_outline, size: 20),
                onPressed: () {
                  carDetailsBottomSheet(context , widget.carsType[index].image , widget.carsType[index].name , widget.carsType[index].details);
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8), // Space between rows
        SvgPicture.asset(
          widget.carsType[index].image,
          height: 18,
        ),
        CustomTextWidget(
          text: widget.carsType[index].name,
          fontSize: widget.carsType[index].islargeText ? 12 : 15,
          color: Colors.black,
        ),
      ],
    ),
  ),
),

            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 3);
        },
      ),
    );
  }
}
*/

class CarSelection extends StatefulWidget {
  final List<CarType> carsType;
  final int selectedIndex;
  final Function(int) onCarSelected;

  const CarSelection({
    super.key,
    required this.carsType,
    required this.selectedIndex,
    required this.onCarSelected,
  });
  @override
  _CarSelectionState createState() => _CarSelectionState();
}

class _CarSelectionState extends State<CarSelection> {
  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final sizeOfScreen = MediaQuery.sizeOf(context).height;
    final widthOfScreen = MediaQuery.sizeOf(context).width;

    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      height: sizeOfScreen / 8.6,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.carsType.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 13,
              ),
              InkWell(
                onTap: () {
                  /*setState(() {
      selectedIndex = index;
    });*/
                  //selectedIndex = index;
                  widget.onCarSelected(index); // Notify parent of selection
                },
                child: Container(
                  height: sizeOfScreen / 8.7,
                  width: widthOfScreen / 4.8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: widget.selectedIndex == index
                        ? ColorManager.yellow
                            .withOpacity(1.0) // Full brightness for selected
                        : ColorManager.yellow.withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4), // Slight shadow
                        blurRadius: 6, // Soft blur effect
                        offset: Offset(0, 7),
                      ),
                    ], // Dimmed for unselected
                  ),
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 2, left: 5),
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.error_outline, size: 20),
                              onPressed: () {
                                carDetailsBottomSheet(
                                    context,
                                    widget.carsType[index].image,
                                    widget.carsType[index].name,
                                    widget.carsType[index].details);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Space between rows
                      SvgPicture.asset(
                        widget.carsType[index].image,
                        height: 18,
                      ),
                      CustomTextWidget(
                        text: widget.carsType[index].name,
                        fontSize: widget.carsType[index].islargeText ? 12 : 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 3);
        },
      ),
    );
  }
}
