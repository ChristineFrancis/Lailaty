import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/button_like_text_field.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/ride_car_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/ride_motor_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/text_field_with_Arabic_prefix.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/widget_after_select_station.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/widget_after_write_direction.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class MapAndOrderDetails extends StatelessWidget {
   final TextEditingController directionController = TextEditingController();
  List <CarType> carsType=
  [
    CarType(name: 'Ride', image: ImageAssetManager.rideCar, islargeText: false , ),
    CarType(name: 'Ride', image: ImageAssetManager.comfortBlackCar , islargeText: false),
    CarType(name: 'Ride', image: ImageAssetManager.rideMotor , islargeText: false),
    CarType(name: 'زفاف - رجال اعمال', image: ImageAssetManager.weddingCar , islargeText: true),
    CarType(name: 'تعليم قيادة', image: ImageAssetManager.leaningCar , islargeText: true),
    CarType(name: 'سفر', image: ImageAssetManager.rideCar , islargeText: false),
    CarType(name: 'على مودك', image: ImageAssetManager.rideCar , islargeText: false),
  ];
  

  MapAndOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
   final sizeOfGreySection=MediaQuery.sizeOf(context).height/2 +40;
   final widthOfScreen=MediaQuery.sizeOf(context).width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.grey,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu , color: ColorManager.yellow,) , ),
          
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height/2-30,
              color: Colors.white,
            ),
            RideMotorWidget(sizeOfGreySection: MediaQuery.sizeOf(context).height/2 +40,carsType: carsType,),
            //WidgetAfterSelectStations(sizeOfGreySection: MediaQuery.sizeOf(context).height*0.6 ,carsType: carsType ),
            //WidgetAfterWriteDirection(sizeOfGreySection: MediaQuery.sizeOf(context).height*0.6 ,carsType: carsType )
            //RideCarWidget(sizeOfGreySection: MediaQuery.sizeOf(context).height/2 +40,carsType: carsType,)
        
          ],
        ),
      ),
    );
  }
}
class CarType
{
  final String name;
  final String image;
  final bool islargeText;

  CarType({required this.islargeText, required this.name, required this.image});

}