import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ala_modak_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/learn_driving_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/luxury_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_car_select_other_stations_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_car_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_motor_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/travel_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/travel_widget_after.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/wedding_and_business_men_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/wedding_buisiness_men_after_select_car_startLocation_destinationLocation_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/ride_car_after.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/Drawer/my_drawer.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

// ignore: must_be_immutable
class MapAndOrderDetails extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final TextEditingController directionController = TextEditingController();

  List<CarType> carsType = [
    CarType(
        name: 'Ride',
        image: ImageAssetManager.rideCar,
        islargeText: false,
        details:
            'نوفر لك رحلات سريعة وبأسعار عادلة للتنقل في المدينة بالسعر اللي تحدده وبتكلفة معقولة\n\nيمكنك اختيار شريك سائق كابتن او ليدي كابتن'),
    CarType(
        name: 'Luxury',
        image: ImageAssetManager.comfortBlackCar,
        islargeText: false,
        details:
            'نوفر لك رحلات سريعة ذات رفاهية اكثر وبأسعار عادلة للتنقل في المدينة بتكلفة معقولة\n\nيمكنك اختيار شريك سائق كابتن او ليدي كابتن'),
    CarType(
        name: 'Trip',
        image: ImageAssetManager.rideMotor,
        islargeText: false,
        details:
            'نوفر لك رحلات سريعة وبأسعار عادلة للتنقل في المدينة بالسعر اللي تحدده وبتكلفة معقولة\n\nيمكنك اختيار شريك سائق كابتن او ليدي كابتن'), //!يمكنك اختيار شريك سائق كابتن او ليدي كابتن
    CarType(
        name: 'زفاف - رجال اعمال',
        image: ImageAssetManager.weddingCar,
        islargeText: true,
        details:
            'نوفر لك جميع السيارات لرحلات أكثر راحة وذات رفاهية للمناسبات الزفاف ورجال الأعمال بجميع الأسعار المناسبة لك من مكانك مباشرة لجميع الوجهات الفعلية لمشوارك حتي اتمامه\n\nنعمل علي توفير المال والوقت والراحة والأمان لك ادخل على الفئة السعرية المناسبة واختار سيارتك بالسعر الذي تحدد علما بوجود حد ادني موضح لسعر كل فئة وبعد التفاوض علي السعر يتم تحويلك لمبلغ كجديه حجز ويتراوح من 10% الى 25 % على حسب فئه السيارة وتوصلك للشريك السائق'),
    CarType(
        name: 'تعليم قيادة',
        image: ImageAssetManager.leaningCar,
        islargeText: true,
        details:
            'نوفر لك جميع السيارات الأوتوماتيك والعادية لتعليم القيادة وتوصيلك لأقرب شريك سائق لمكانك نعمل على توفير المال والوقت والراحة والأمان لك اختار سياراتك اللي هتتعلم عليها ومدة الكورس وعدد الأيام بسعر معقول\n\nبعد اختيارك للسيارة يتم تحويل مبلغ يتم إشعارك به كجديه حجز وتوصيلك للشريك السائق\n\nيمكنك اختيار شريك سائق كابتن او ليدي كابتن '),
    CarType(
        name: 'سفر',
        image: ImageAssetManager.rideCar,
        islargeText: false,
        details:
            'نوفر لك رحلات مريحة من مدينتك لجميع المدن الأخرى بالأجرة التي تناسبك حدد الوقت والتاريخ وإركب من أمام باب منزلك مباشر إلي وجهتك الفعلية\n\nيمكنك حجز المقاعد لرحلة خاصة او مشاركة الرحلة مع ركاب اخرين والدفع مقابل مقعد فقط\n\nيمكنك اختيار شريك سائق كابتن او ليدي كابتن'),
    CarType(
        name: 'على مودك',
        image: ImageAssetManager.rideCar,
        islargeText: false,
        details:
            'نوفر لك جميع السيارات الأوتوماتيك والعادية لتعليم القيادة وتوصيلك لأقرب شريك سائق لمكانك نعمل على توفير المال والوقت والراحة والأمان لك اختار سياراتك اللي هتتعلم عليها ومدة الكورس وعدد الأيام بسعر معقول\n\nبعد اختيارك للسيارة يتم تحويل مبلغ يتم إشعارك به كجديه حجز وتوصيلك للشريك السائق\n\nيمكنك اختيار شريك سائق كابتن او ليدي كابتن'),
  ];

  MapAndOrderDetails({super.key});

  @override
  State<MapAndOrderDetails> createState() => _MapAndOrderDetailsState();
}

class _MapAndOrderDetailsState extends State<MapAndOrderDetails> {
  int selectedCarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sizeOfGreySection = MediaQuery.sizeOf(context).height / 2 + 40;
    return Scaffold(
      key: widget.scaffoldkey,
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
                widget.scaffoldkey.currentState!.openEndDrawer();
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

            //! Ride

            Visibility(
              visible: selectedCarIndex == 0,
              child: RideCarWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            Visibility(
              visible: false, //TODO
              child: RideCarSelectOtherStations(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.6,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            Visibility(
              visible: false, //TODO
              child: RideCarAfterWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.6,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            //! LUXURY
            Visibility(
              visible: selectedCarIndex == 1,
              child: LuxuryWidget(
                sizeOfGreySection: sizeOfGreySection,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            //! TRIP
            Visibility(
              visible: selectedCarIndex == 2,
              child: RideMotorWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            //! زفاف- رجال اعمال
            Visibility(
              visible: selectedCarIndex == 3,
              child: WeddingAndBusinessMenWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.8,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            Visibility(
              visible: false,
              child:
                  WeddingBuisinessMenAfterSelectCarStartlocationDestinationlocationWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.8,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            //! تعلم القيادة
            Visibility(
              visible: selectedCarIndex == 4,
              child: LearnDrivingWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            //! سفر

            Visibility(
              visible: selectedCarIndex == 5,
              child: TravelWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.9,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            Visibility(
              visible: false,
              child: TravelWidgetAfter(
                sizeOfGreySection: MediaQuery.sizeOf(context).height * 0.9,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            //! على مودك
            Visibility(
              visible: selectedCarIndex == 6,
              child: AlaModakWidget(
                sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 - 40,
                carsType: widget.carsType,
                selectedIndex: selectedCarIndex,
                onCarSelected: (index) {
                  setState(() {
                    selectedCarIndex = index;
                  });
                },
              ),
            ),

            //DriverOfferWithTimer()

            /*JourneyInCarWidget(
              sizeOfGreySection: MediaQuery.sizeOf(context).height / 2 + 40,
              carsType: widget.carsType,
              selectedIndex: selectedCarIndex,
              onCarSelected: (index) {
                setState(() {
                  selectedCarIndex = index;
                });
              },
            ),*/
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
