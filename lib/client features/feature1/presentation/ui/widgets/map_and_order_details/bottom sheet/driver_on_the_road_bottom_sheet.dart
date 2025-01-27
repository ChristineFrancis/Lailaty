import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver-accept_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/reasons_for_canceling_order_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future driverOnTheRoadBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      final heightOfScreen = MediaQuery.of(context).size.height;
      final widthOfScreen = MediaQuery.of(context).size.width;
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return 
              Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                 // margin: EdgeInsets.symmetric(horizontal: widthOfScreen/10),
                 padding:EdgeInsets.symmetric(horizontal: widthOfScreen/18),
                  decoration: BoxDecoration(
                     borderRadius:  BorderRadius.all(Radius.circular(10) ),
                    color: ColorManager.grey,
                  ),
                  height: heightOfScreen / 3.7,
                  child: Directionality(
                          textDirection: TextDirection.rtl,
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                         hasScrollBody: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min, 
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height :10,),
                              Center(child: CustomTextWidget(text:'الكابتن في الطريق' , fontSize: 25, color: Colors.black )),
                              Spacer(flex: 2,),
                             Padding(
                               padding:  EdgeInsets.symmetric(horizontal:widthOfScreen/20),
                               child: CustomButton(textButton: 'مواصلة الانتظار', textSize: 23,
                               onTap: () { },),
                             ),
                             Spacer(flex: 1,),
                             InkWell(
                              child: CustomTextWidget(text:'الغاء الطلب' , fontSize: 27, color: Colors.black , fontWeight: FontWeight.w900, ),
                              onTap: () async{
                               await reasonsForCancelOrderBottomSheet(context);
                              },),
                              Spacer(flex: 2,),
                                                
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
        },
      );
    },
  );
}