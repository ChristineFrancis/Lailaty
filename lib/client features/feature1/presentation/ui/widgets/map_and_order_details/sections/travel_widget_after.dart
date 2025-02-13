import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/private_trip_after_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

///////////////26
// ignore: must_be_immutable
class TravelWidgetAfter extends StatelessWidget {
  final double sizeOfGreySection;
  final List<CarType> carsType;
  final int selectedIndex;
  final Function(int) onCarSelected;

  //!-------------------------------------------------------------------
  final TextEditingController startingLocationController =
      TextEditingController();
  final TextEditingController destinationLocationController =
      TextEditingController();
  final TextEditingController commentsController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController numberOfdaysController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  //!-------------------------------------------------------------------
  List<CarType> travelCarsType = [
    CarType(
        name: 'رحلة خاصة',
        image: ImageAssetManager.rideCar,
        islargeText: true,
        details: ''),
    CarType(
        name: 'رحلة مشتركة',
        image: ImageAssetManager.rideCar,
        islargeText: true,
        details: ''),
  ];

  TravelWidgetAfter(
      {super.key,
      required this.sizeOfGreySection,
      required this.carsType,
      required this.selectedIndex,
      required this.onCarSelected});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen = MediaQuery.sizeOf(context).width;
    final heightOfScreen = MediaQuery.sizeOf(context).height;

    return Container(
      margin: EdgeInsets.only(top: heightOfScreen * 0.08),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: ColorManager.grey,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          //physics : NeverScrollableScrollPhysics(),
          //shrinkWrap: false,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarSelection(
                    carsType: carsType,
                    selectedIndex: selectedIndex,
                    onCarSelected: onCarSelected,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width / 7,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CurrentAndNextLocationWord(
                              isCurrentLocation: true,
                            ),
                            SizedBox(
                              height: sizeOfGreySection / 45,
                            ),
                            CurrentAndNextLocationWord(
                              isCurrentLocation: false,
                            ),
                            SizedBox(
                              width: widthOfScreen / 12,
                            ),
                          ])),
                  //! CarSelection(carsType: travelCarsType,),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width / 7,
                    ),
                    child: PrivateTripAfterWidget(
                      commentsController: commentsController,
                      numberOfdaysController: numberOfdaysController,
                      sizeOfGreySection: sizeOfGreySection,
                      timeController: timeController,
                      priceController: priceController,
                    ),
                    //GeneralTripafterWidget(commentsController: commentsController,numberOfdaysController: numberOfdaysController,sizeOfGreySection: sizeOfGreySection,timeController: timeController,),
                  ),

                  Spacer(
                    flex: 3,
                  ),
                  PayAndySearchDriverAndChoices(
                    notesController: notesController,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  //SizedBox(height: sizeOfGreySection/28),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
