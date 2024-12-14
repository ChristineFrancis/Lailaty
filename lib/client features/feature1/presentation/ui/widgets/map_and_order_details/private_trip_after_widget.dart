import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/suggest_your_price_bottom_sheet.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_suffix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class PrivateTripAfterWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final TextEditingController timeController;
   final TextEditingController numberOfdaysController;
    final TextEditingController commentsController;
    final TextEditingController priceController;
  const PrivateTripAfterWidget({super.key, required this.sizeOfGreySection, required this.timeController, required this.numberOfdaysController, required this.commentsController, required this.priceController});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    final heightOfScreen=MediaQuery.sizeOf(context).height;
    return Column(
                  children: [
                 InkWell(
              onTap: () {},
              child:CustomTextFormFieldName(hintText:'التاريخ', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 ,isReadonly: true,) ,
             ),
                 SizedBox(height: sizeOfGreySection/75),
                 CustomTextFormFieldName(hintText:'الوقت', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06),
                 
                 //SizedBox(height: sizeOfGreySection/45),
                 
                 SizedBox(height: sizeOfGreySection/75),
                 CustomTextFormFieldName(hintText:'عدد الركاب', controller:numberOfdaysController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 , isNum: true,),
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
                  InkWell(
                   onTap: ()async{await suggestYourPriceBottomSheet(context , priceController); },
                  child: CustomTextFormFieldSuffix(hintText: 'اقترح السعر المناسب',fontSizeText: 18 , hintTextColor: Colors.black , suffixIcon:Icon(Icons.edit_outlined) , isReadonly: true , isArabic: true ,textAlign: TextAlign.start,)),
                 
                
                 SizedBox(height: sizeOfGreySection/75),
                 
                 CustomTextFormFieldName(hintText:'التعليقات', controller:commentsController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start
                 , fontSizeText: 18,heightTextFormField: heightOfScreen * 0.06),
                      ],
                  );
  }
}