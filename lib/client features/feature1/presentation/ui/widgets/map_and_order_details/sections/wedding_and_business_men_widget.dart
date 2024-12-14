import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/suggest_your_price_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/button_like_text_field.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_choose_wedding_car_choices.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/text_field_with_Arabic_prefix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_suffix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
//////////////////21
class WeddingAndBusinessMenWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final List <CarType> carsType;
 final TextEditingController startingLocationController=TextEditingController();
 final TextEditingController destinationLocationController=TextEditingController();
 final TextEditingController commentsController=TextEditingController();
 final TextEditingController timeController=TextEditingController();
 final TextEditingController numberOfdaysController=TextEditingController();
 final TextEditingController notesController=TextEditingController();
 final TextEditingController priceController=TextEditingController();

   WeddingAndBusinessMenWidget ({super.key, required this.sizeOfGreySection, required this.carsType});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    final heightOfScreen=MediaQuery.sizeOf(context).height;

    return Container(
         margin: EdgeInsets.only(top:heightOfScreen*0.1 , bottom: 0),
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
            CustomTextFormFieldName(hintText:'من', controller:startingLocationController ,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start,heightTextFormField: heightOfScreen * 0.06),
            
             SizedBox(height: sizeOfGreySection/45),
             CustomTextFormFieldName(hintText:'الى', controller:destinationLocationController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06),
             
             SizedBox(height: sizeOfGreySection/45),
             CustomTextFormFieldName(hintText:'عدد الايام', controller:numberOfdaysController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 , isNum: true,),
             SizedBox(height: sizeOfGreySection/45),
             InkWell(
              onTap: () {},
              child:CustomTextFormFieldName(hintText:'التاريخ', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 ,isReadonly: true,) ,
             ),
            //  ButtonLikeTextField(text:'التاريخ',  heightContainer: heightOfScreen * 0.06, textSize: 22,
            //  suffixWidget: Container(width:widthOfScreen/3.3 ,),onPressed: () {},fontWeight: FontWeight.w400),
            
             SizedBox(height: sizeOfGreySection/45),
             CustomTextFormFieldName(hintText:'الوقت', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06),
             
             SizedBox(height: sizeOfGreySection/45),
             CustomTextFormFieldName(hintText:'تعليقاتك ومسار الرحلة بالكامل', controller:commentsController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start
             , fontSizeText: 18,heightTextFormField: heightOfScreen * 0.06),
            
             SizedBox(height: sizeOfGreySection/45),

             InkWell(
                   onTap: () async{await suggestYourPriceBottomSheet(context , priceController); },
                  child: CustomTextFormFieldSuffix(hintText: 'اقترح السعر المناسب',fontSizeText: 18 , hintTextColor: Colors.black , suffixIcon:Icon(Icons.edit_outlined) , isReadonly: true , isArabic: true ,textAlign: TextAlign.start,)),
             
             SizedBox(height: sizeOfGreySection/20),
                  ],
              ),
          ),
         // Spacer(flex: 3,),
        PayChooseWeddingCarChoices(notesController: notesController,),
        //Spacer(flex: 1,)
         SizedBox(height: sizeOfGreySection/28),
                      ],
                    ),
                  ],
                ),
              ),
              
            );
  }
}