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
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
//////////////////////23
class WeddingBuisinessMenAfterSelectCarStartlocationDestinationlocationWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final List <CarType> carsType;
 final TextEditingController startingLocationController=TextEditingController();
 final TextEditingController destinationLocationController=TextEditingController();
 final TextEditingController commentsController=TextEditingController();
 final TextEditingController timeController=TextEditingController();
 final TextEditingController numberOfdaysController=TextEditingController();
 final TextEditingController notesController=TextEditingController();
 final TextEditingController priceController=TextEditingController();

   WeddingBuisinessMenAfterSelectCarStartlocationDestinationlocationWidget ({super.key, required this.sizeOfGreySection, required this.carsType});

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
            padding: EdgeInsets.symmetric(horizontal:widthOfScreen/10, ),
            child: Column(
            children: [
            CurrentAndNextLocationWord(isCurrentLocation: true,),
             SizedBox(height:sizeOfGreySection/45 ,),
             Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 CurrentAndNextLocationWord(isCurrentLocation: false,),
                 SizedBox(width: widthOfScreen/12,),
                 SizedBox(
                  height:sizeOfGreySection/13,
                  width: widthOfScreen/4 +20,
                  child: CustomButton(textButton: '+محطات اخرى ',textSize:15,fontWeight:FontWeight.w600 , onTap: () { }))
               ],
             ),
             
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:widthOfScreen/24, ),
              child: Column(
                children: [
                   SizedBox(height: sizeOfGreySection/45),
               CustomTextFormFieldName(hintText:'عدد الايام', controller:numberOfdaysController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 , isNum: true,),
               SizedBox(height: sizeOfGreySection/45),
               InkWell(
              onTap: () {},
              child:CustomTextFormFieldName(hintText:'التاريخ', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 ,isReadonly: true,) ,
             ),
              //  ButtonLikeTextField(text:'التاريخ',  heightContainer: heightOfScreen * 0.06, textSize: 22,
              // suffixWidget: Container(width:widthOfScreen/2.4,),onPressed: () {},fontWeight: FontWeight.w400),
              
               SizedBox(height: sizeOfGreySection/45),
               CustomTextFormFieldName(hintText:'الوقت', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06),
               
               SizedBox(height: sizeOfGreySection/45),
               CustomTextFormFieldName(hintText:'تعليقاتك ومسار الرحلة بالكامل', controller:commentsController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start
               , fontSizeText: 18,heightTextFormField: heightOfScreen * 0.06),
              
               SizedBox(height: sizeOfGreySection/90),
               Container(
                margin: EdgeInsets.symmetric(horizontal: widthOfScreen/15),
                padding:EdgeInsets.symmetric(vertical: 1),
                decoration: const BoxDecoration(
                color: ColorManager.yellow,
                borderRadius:  BorderRadius.all(Radius.circular(15) )),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline , color:ColorManager.grey , size: 19,),
                  SizedBox(width:3 ,),
                  Center(
                   child: CustomTextWidget(text:'السعر الموصى به 950 EGP' , fontSize: 15,color: Colors.black , fontWeight:FontWeight.w400  ,)),
                ],
              ),
               ),
               SizedBox(height: sizeOfGreySection/90),
              
               SizedBox(
                    width:widthOfScreen*0.8,
                     child: ButtonLikeTextField(text:'90 EGP- انقر لاقتراح السعر المناسب' ,textSize:14, fontWeight:FontWeight.w400 ,heightContainer: heightOfScreen * 0.06,
                     suffixWidget:Icon(Icons.edit_outlined), 
                     //width: widthOfScreen*0.8,
                      onPressed: () async{await suggestYourPriceBottomSheet(context , priceController); },),
                   ),
               
               SizedBox(height: sizeOfGreySection/40),
                ],
              ),
            )
                  ],
              ),
          ),
         // Spacer(flex: 3,),
        PayAndySearchDriverAndChoices(notesController:notesController),
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