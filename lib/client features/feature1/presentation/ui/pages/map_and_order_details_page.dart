import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/button_like_text_field.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/offer/driver_offer_with_timer.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ala_modak_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/journey_in_car_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/learn_driving_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_car_select_other_stations_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_car_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_motor_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/text_field_with_Arabic_prefix.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/travel_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/travel_widget_after.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/wedding_and_business_men_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/wedding_buisiness_men_after_select_car_startLocation_destinationLocation_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_car_after.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/widget_after_write_direction.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/Drawer/my_drawer.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class MapAndOrderDetails extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final TextEditingController directionController = TextEditingController();

  List<CarType> carsType = [
    CarType(
        name: 'Ride',
        image: ImageAssetManager.rideCar,
        islargeText: false,
        details:
            'نوفر لك رحلات سريعة وبأسعار عادلة للتنقل في المدينة بالسعر اللي تحدده وبتكلفة معقولة'),
    CarType(
        name: 'Luxury',
        image: ImageAssetManager.comfortBlackCar,
        islargeText: false,
        details:
            'نوفر لك رحلات سريعة وبأسعار عادلة للتنقل في المدينة بالسعر اللي تحدده وبتكلفة معقولة'),
    CarType(
        name: 'Trip',
        image: ImageAssetManager.rideMotor,
        islargeText: false,
        details:
            'نوفر لك رحلات سريعة وبأسعار عادلة للتنقل في المدينة بالسعر اللي تحدده وبتكلفة معقولة'),
    CarType(
        name: 'زفاف - رجال اعمال',
        image: ImageAssetManager.weddingCar,
        islargeText: true,
        details:
            'نوفر لك رحلات سريعة وبأسعار عادلة للتنقل في المدينة بالسعر اللي تحدده وبتكلفة معقولة'),
    CarType(
        name: 'تعليم قيادة',
        image: ImageAssetManager.leaningCar,
        islargeText: true,
        details:
            'نوفر لك جميع السيارات الأوتوماتيك والعادية لتعليم القيادة وتوصيلك لأقرب شريك سائق لمكانك نعمل على توفير المال والوقت والراحة والأمان لك اختار سياراتك اللي هتتعلم عليها ومدة الكورس وعدد الأيام بسعر معقول\n\nبعد اختيارك للسيارة يتم تحويل مبلغ يتم إشعارك به كجديه حجز وتوصيلك للشريك السائق '),
    CarType(
        name: 'سفر',
        image: ImageAssetManager.rideCar,
        islargeText: false,
        details:
            'نوفر لك رحلات سريعة وبأسعار عادلة للتنقل في المدينة بالسعر اللي تحدده وبتكلفة معقولة'),
    CarType(
        name: 'على مودك',
        image: ImageAssetManager.rideCar,
        islargeText: false,
        details:
            'نوفر لك جميع السيارات الأوتوماتيك والعادية لتعليم القيادة وتوصيلك لأقرب شريك سائق لمكانك نعمل على توفير المال والوقت والراحة والأمان لك اختار سياراتك اللي هتتعلم عليها ومدة الكورس وعدد الأيام بسعر معقول\n\nبعد اختيارك للسيارة يتم تحويل مبلغ يتم إشعارك به كجديه حجز وتوصيلك للشريك السائق'),
  ];

  MapAndOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOfGreySection = MediaQuery.sizeOf(context).height / 2 + 40;
    final widthOfScreen = MediaQuery.sizeOf(context).width;
    return Scaffold(
      key: scaffoldkey,
      resizeToAvoidBottomInset: true,
      endDrawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: ColorManager.grey,
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: ColorManager.yellow,
              ),
              onPressed: () {
                scaffoldkey.currentState!.openEndDrawer();
              }),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 2 - 30,
              color: Colors.white,
            ),

            //Ala Modak
            /*AlaModakWidget(
              sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
              carsType: carsType,
            ),*/

            // learn driving
            LearnDrivingWidget(
              sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
              carsType: carsType,
            ),

            //26
            /* TravelWidgetAfter(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.9,
                carsType: carsType),*/

            //24 _ 25
            /*TravelWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.9,
                carsType: carsType),*/

            //23
            /*WeddingBuisinessMenAfterSelectCarStartlocationDestinationlocationWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.8,
                carsType: carsType),*/

            //21
            /*WeddingAndBusinessMenWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.8,
                carsType: carsType),*/

            //20
            /*RideMotorWidget(
              sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
              carsType: carsType,
            ),*/

            //19
            /*RideCarAfterWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.6,
                carsType: carsType),*/

            //18
            /*RideCarSelectOtherStations(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.6,
                carsType: carsType),*/

            //17
            /*RideCarWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
                carsType: carsType),*/
            //DriverOfferWithTimer()

            /*JourneyInCarWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
                carsType: carsType),*/
          ],
        ),
      ),
    );
  }
}

class CarType {
  final String name;
  final String image;
  final bool islargeText;
  final String details;

  CarType(
      {required this.islargeText,
      required this.name,
      required this.image,
      required this.details});
}
