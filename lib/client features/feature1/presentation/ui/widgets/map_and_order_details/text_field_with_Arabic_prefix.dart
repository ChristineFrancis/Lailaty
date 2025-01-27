// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/privacy_and_age_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class TextFieldWithArabicPrefix extends StatelessWidget {
  final String hintText;
  final String PrefixText;
  const TextFieldWithArabicPrefix({
    Key? key,
    required this.hintText, required this.PrefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fieldWidth = screenWidth * 0.8;
    double fieldheight = screenHeight * 0.05;
    //double fontSize = screenWidth * 0.07;
    return  SizedBox(
      height: fieldheight,
    width: MediaQuery.of(context).size.width*0.7, 
    child: Stack(
     alignment: Alignment.centerRight,
     children: [
     TextField(
      style:TextStyle(height: screenHeight * 0.001, fontSize: getResponsiveText(21, context)),
      textDirection: TextDirection.rtl, 
      decoration: InputDecoration(
      focusColor: Colors.black,
      contentPadding: EdgeInsets.only( right: 50,),
                       // left: 40, // Ensure space for the "الى  
      filled: true,
      fillColor: Colors.white, 
      hintText: hintText,
      
      hintStyle: TextStyle(
       height: 1.2,
      fontSize:  getResponsiveText(21, context),
      //fontWeight:FontWeight.w600 ,
      color: ColorManager.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.black, // Border color
          width: 3,), ),
     enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
       borderSide: const BorderSide(color: Colors.black, width: 2),),
       focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.black, width: 2),
                            ), )
                  ),
                  Positioned(
                    right: 15, // Padding to position the constant word
                    child:  CustomTextWidget(text:PrefixText ,fontSize: getResponsiveText(20, context) , color: Colors.black , fontWeight: FontWeight.w400 ,), 
                  ),
       ],),);
  }
}
