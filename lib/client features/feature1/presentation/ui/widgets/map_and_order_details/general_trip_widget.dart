import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/suggest_your_price_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/button_like_text_field.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_suffix.dart';

class GeneralTripWidget extends StatelessWidget {
  final double sizeOfGreySection;
  final TextEditingController timeController;
  final TextEditingController numberOfdaysController;
  final TextEditingController commentsController;
  final TextEditingController priceController;

  const GeneralTripWidget({super.key, required this.sizeOfGreySection, required this.timeController, required this.numberOfdaysController, required this.commentsController, required this.priceController});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    final heightOfScreen=MediaQuery.sizeOf(context).height;
    return Column(
                  children: [
                    InkWell(
              onTap: () {},
              child:CustomTextFormFieldName(hintText:'التاريخ', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 ,isReadonly: true, fontSizeText: 18) ,
             ),
                //  ButtonLikeTextField(text:'التاريخ',  heightContainer: heightOfScreen * 0.06, textSize: 22,
                //  suffixWidget: Container(width:widthOfScreen/3.3 ,),onPressed: () {},fontWeight: FontWeight.w400),
                 SizedBox(height: sizeOfGreySection/75),
                 CustomTextFormFieldName(hintText:'الوقت', controller:timeController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 ,  fontSizeText: 18),
                 
                 //SizedBox(height: sizeOfGreySection/45),
                 
                 SizedBox(height: sizeOfGreySection/75),
                 CustomTextFormFieldName(hintText:'عدد المقاعد', controller:numberOfdaysController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start, heightTextFormField: heightOfScreen * 0.06 , isNum: true, fontSizeText: 18),
                 SizedBox(height: sizeOfGreySection/75),
                 InkWell(
                   onTap: () async{await suggestYourPriceBottomSheet(context ,priceController); },
                  child: CustomTextFormFieldSuffix(hintText: 'اقترح السعر المناسب',fontSizeText: 18 , hintTextColor: Colors.black , suffixIcon:Icon(Icons.edit_outlined) , isReadonly: true , isArabic: true ,textAlign: TextAlign.start,)),
                //   ButtonLikeTextField(text:'اقترح السعر المناسب' ,textSize: 22, fontWeight: FontWeight.w400,heightContainer:heightOfScreen * 0.06,
                //  suffixWidget:Icon(Icons.edit_outlined),
                 
                //  onPressed: ()async {
                //   await suggestYourPriceBottomSheet(context , priceController);

                //  },),
                 
                
                 SizedBox(height: sizeOfGreySection/75),
                 
                 CustomTextFormFieldName(hintText:'التعليقات', controller:commentsController,hintTextColor: Colors.black,isArabic: true,textAlign: TextAlign.start
                 , fontSizeText: 18,heightTextFormField: heightOfScreen * 0.06),
                      ],
                  );
  }
}