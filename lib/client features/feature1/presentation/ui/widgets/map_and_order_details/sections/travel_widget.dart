import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/button_like_text_field.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/general_trip_widget.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_choose_wedding_car_choices.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/text_field_with_Arabic_prefix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
////////////24
class TravelWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final List <CarType> carsType;
 final TextEditingController startingLocationController=TextEditingController();
 final TextEditingController destinationLocationController=TextEditingController();
 final TextEditingController commentsController=TextEditingController();
 final TextEditingController timeController=TextEditingController();
 final TextEditingController numberOfdaysController=TextEditingController();
 final TextEditingController priceController=TextEditingController();
 final TextEditingController notesController=TextEditingController();
 List <CarType> travelCarsType=
  [
    CarType(name: 'رحلة خاصة', image: ImageAssetManager.rideCar , islargeText: true , details: ''),
    CarType(name: 'رحلة مشتركة', image: ImageAssetManager.rideCar , islargeText: true, details: ''),
  ];
  

   TravelWidget ({super.key,
    required this.sizeOfGreySection, required this.carsType});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    final heightOfScreen=MediaQuery.sizeOf(context).height;

    return Container(
         margin: EdgeInsets.only(top:heightOfScreen*0.02 ),
         decoration: BoxDecoration(
         borderRadius:  BorderRadius.only(
         topRight: Radius.circular(20) ,
         topLeft:Radius.circular(20) ),
         color: ColorManager.grey,),
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
             CarSelection(carsType: carsType,),
             Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width/7, ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [
              CustomTextFormFieldName(hintText:'من', controller:startingLocationController ,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start,heightTextFormField: heightOfScreen * 0.06 ,  fontSizeText: 18),
              
               SizedBox(height: sizeOfGreySection/75),
               CustomTextFormFieldName(hintText:'الى', controller:destinationLocationController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 ,  fontSizeText: 18),
               //SizedBox(height: sizeOfGreySection/45),
              ])),
              CarSelection(carsType: travelCarsType,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width/7, ),
                child: GeneralTripWidget(commentsController: commentsController,numberOfdaysController: numberOfdaysController,sizeOfGreySection: sizeOfGreySection,timeController: timeController, priceController: priceController,),
              ),
            
            Spacer(flex: 3,),
           PayAndySearchDriverAndChoices(notesController:notesController),
            Spacer(flex: 2,),
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