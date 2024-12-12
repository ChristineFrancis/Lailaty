import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future enterYourPathBottomSheet(BuildContext context , TextEditingController controller) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      final heightOfScreen = MediaQuery.of(context).size.height;
      final widthOfScreen = MediaQuery.of(context).size.width;
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {


          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
             // margin: EdgeInsets.symmetric(horizontal: widthOfScreen/10),
             padding:EdgeInsets.symmetric(horizontal: widthOfScreen/22),
              decoration: BoxDecoration(
                 borderRadius:  BorderRadius.all(Radius.circular(10) ),
                color: ColorManager.grey,
              ),
              height: heightOfScreen *0.99,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child:  CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(right:  widthOfScreen/22),
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context); 
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: CustomTextWidget(
                                    text:'ادخل مسارك',
                                    fontSize: 27,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: heightOfScreen/20,),
                                //Spacer(flex: 1,),
                            Center(
                              child: SizedBox(
                              width: widthOfScreen* 0.8,
                              height:heightOfScreen * 0.06,
                              child: TextFormField(

                                textDirection: TextDirection.rtl , 
                                controller: controller,
                                textAlign: TextAlign.right,
                                style:
                                    TextStyle(height: heightOfScreen * 0.001, fontSize:20.sp),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'الى',
                                   prefixIcon: Icon(Icons.search),
                                  // suffixIcon: suffixWidget?? Container() ,
                                  // suffix:suffixWidget?? Container() ,
                                  hintStyle: TextStyle(
                                     height: 1.2,
                                    fontSize:23.sp,
                                    color:Colors.black), // Hint covers entire field
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                                      color: Colors.black, width: 4), // Thicker border
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.black, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.black, width: 2),
                                  ),
                                ),
                              ),
                                                        ),
                            ),
                                SizedBox(height: heightOfScreen/20,),
                                CustomTextWidget(text: 'اختر على الخريطة', fontSize: 22, color: ColorManager.blue , fontWeight:FontWeight.w900 ,)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),
          );
        },
      );
    },
  );
}
