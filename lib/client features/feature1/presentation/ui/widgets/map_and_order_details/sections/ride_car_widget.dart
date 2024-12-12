import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/button_like_text_field.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/text_field_with_Arabic_prefix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
////////////////17
class RideCarWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final List <CarType> carsType;
  final TextEditingController notesController=TextEditingController();
   RideCarWidget({super.key, required this.sizeOfGreySection, required this.carsType});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    return Container(
         margin: EdgeInsets.only(top:MediaQuery.sizeOf(context).height/2 -40 , bottom: 0),
         decoration: BoxDecoration(
         borderRadius:  BorderRadius.only(
         topRight: Radius.circular(20) ,
         topLeft:Radius.circular(20) ),
         color: ColorManager.grey,),
         child: Directionality(
      textDirection: TextDirection.rtl,
       child: ListView(
        //physics : NeverScrollableScrollPhysics(),
        shrinkWrap: false,
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           CarSelection(carsType: carsType,),
           Padding(
            padding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).width/7, ),
            child: Column(
            children: [
             CurrentAndNextLocationWord(isCurrentLocation: true,),
             SizedBox(height: sizeOfGreySection/27),
             TextFieldWithArabicPrefix(hintText: 'lorem ipsum' ,PrefixText:'الى' ,),
             SizedBox(height: sizeOfGreySection/27),
             ButtonLikeTextField(text:'اقترح السعر المناسب' ,textSize: 20, fontWeight:FontWeight.w400 ,
             suffixWidget:Icon(Icons.edit_outlined),
             // width: widthOfScreen*0.7,
             onPressed: () {},),
             SizedBox(height: sizeOfGreySection/25),
                  ],
              ),
          ),
        PayAndySearchDriverAndChoices(notesController: notesController,),
         SizedBox(height: sizeOfGreySection/28),
                      ],
                    ),
                  ],
                ),
              ),
              
            );
  }
}