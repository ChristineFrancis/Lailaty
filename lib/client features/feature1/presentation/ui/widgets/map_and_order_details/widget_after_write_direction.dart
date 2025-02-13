import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/suggest_your_price_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/button_like_text_field.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/choose_car.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/pay_search_driver_choices.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/text_field_with_Arabic_prefix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class WidgetAfterWriteDirection extends StatefulWidget {
   final double sizeOfGreySection;
  final List <CarType> carsType;
  final TextEditingController notesController=TextEditingController();
  final TextEditingController priceController=TextEditingController();
  
   WidgetAfterWriteDirection({super.key, required this.sizeOfGreySection, required this.carsType});

  @override
  State<WidgetAfterWriteDirection> createState() => _WidgetAfterWriteDirectionState();
}

class _WidgetAfterWriteDirectionState extends State<WidgetAfterWriteDirection> {
  bool switchValue=false;

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    final heightOfScreen=MediaQuery.sizeOf(context).height;
   return Container(
         margin: EdgeInsets.only(top:MediaQuery.sizeOf(context).height*0.3 , bottom: 0),
         decoration: BoxDecoration(
         borderRadius:  BorderRadius.only(
         topRight: Radius.circular(20) ,
         topLeft:Radius.circular(20) ),
         color: ColorManager.grey,),
         child: Directionality(
      textDirection: TextDirection.rtl,
       child: ListView(
        physics : NeverScrollableScrollPhysics(),
        shrinkWrap: false,
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           //!CarSelection(carsType: widget.carsType,),
           Padding(
            padding: EdgeInsets.only(right:MediaQuery.sizeOf(context).width/10, ),
            child: Column(
            children: [
             CurrentAndNextLocationWord(isCurrentLocation: true,),
             SizedBox(height:widget.sizeOfGreySection/25 ,),
             Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 CurrentAndNextLocationWord(isCurrentLocation: false,),
                 SizedBox(width: widthOfScreen/12,),
                 SizedBox(
                  height: widget.sizeOfGreySection/13,
                  width: widthOfScreen/4 +20,
                  child: CustomButton(textButton: '+محطات اخرى ',textSize:14,fontWeight:FontWeight.w600 , onTap: () { }))
               ],
             ),

             SizedBox(height: widget.sizeOfGreySection/25),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(
                  width:widthOfScreen*0.8,
                   child: ButtonLikeTextField(text:'90 EGP- انقر لاقتراح السعر المناسب' ,textSize:17, fontWeight:FontWeight.w400 ,heightContainer:heightOfScreen * 0.06,
                   suffixWidget:Icon(Icons.edit_outlined), 
                   //width: widthOfScreen*0.8,
                    onPressed: () async{await suggestYourPriceBottomSheet(context , widget.priceController); },),
                 ),
               ],
             ),
             SizedBox(height: widget.sizeOfGreySection/29),
             Row(
              children: [
                SvgPicture.asset(ImageAssetManager.automaticAcceptanceIcon),
                CustomTextWidget(text: 'قبول تلقائي لعرض بقيمة EGP 90', fontSize: 17, color: Colors.black,fontWeight:FontWeight.w400 ,),
               Switch(
                 value: switchValue, 
                 onChanged: (value) {
                   setState(() {
                     switchValue=value; 
                   });
                 },
                 
                 inactiveTrackColor:ColorManager.grey ,
                 inactiveThumbColor: ColorManager.yellow,
                 activeColor:ColorManager.yellow,
                 hoverColor: ColorManager.yellow,)


              ],
             )
                  ],
              ),
          ),
          SizedBox(height: widget.sizeOfGreySection/29),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: widthOfScreen/5),
              child: Container(
      height:50,           
      decoration: const BoxDecoration(
       color: ColorManager.yellow,
       borderRadius:  BorderRadius.all(Radius.circular(10) )),
      child: MaterialButton(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(10))) ,
        onPressed:() {} ,
        child: Row(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.error_outline , color:ColorManager.grey ,),
                SizedBox(width:3 ,),
                Center(
                 child: CustomTextWidget(text:'السعر الموصى به 90 EGP\nوقت السفر: 11 دقيقة' , fontSize: 15,color: Colors.black , fontWeight:FontWeight.w600 ,)),
              ],
            ),
          ],
        ),
                ),
    ),
            ),
            SizedBox(height: widget.sizeOfGreySection/20),

            PayAndySearchDriverAndChoices(notesController: widget.notesController,),
         SizedBox(height: widget.sizeOfGreySection/28),
                      ],
                    ),
                  ],
                ),
              ),
              
            );
  }
}