import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver_on_the_road_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/reasons_for_canceling_order_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future driverAcceptBottomSheet(BuildContext context) {
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
                  height: heightOfScreen / 1.5,
                  child: Directionality(
                          textDirection: TextDirection.rtl,
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                         hasScrollBody: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.min, 
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height :10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomTextWidget(text: 'وافق محمد على طلبك مقابل سيصل خلال 3 دقائق', fontSize: 17, color: Colors.black )),
                                    SizedBox(width: widthOfScreen*0.1,),
                                    Column(
                                      children: [
                                        SvgPicture.asset(ImageAssetManager.rideCar),
                                        CustomTextWidget(text:'9153 ق ه ب' , fontSize: 18, color: Colors.black )

                                      ],
                                    )
                                ],
                              ),
                              SizedBox(height :10,),
                              Container(
                                height: 2,
                                color: ColorManager.yellow,
                              ),
                              SizedBox(height :10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  
                                  
                                  SmallYellowCircle(child: SizedBox()  , text: 'محمد',),
                                  SmallYellowCircle(child: Icon(Icons.call_outlined),text: 'الاتصال بالكابتن',),
                                  SmallYellowCircle(child: Icon(Icons.privacy_tip_outlined),text: 'السلامة',),
                                  
                                ],
                              ),
                              SizedBox(height :10,),
                              CustomTextWidget(text:'الدفع' , fontSize: 25, color: Colors.black ),
                              Row(
                              children: [
                                SizedBox(width: widthOfScreen/26,),
                                SvgPicture.asset(ImageAssetManager.moneyIcon),
                                SizedBox(width: widthOfScreen/26,),
                                CustomTextWidget(
                                  text: 'نقداً',
                                  color:Colors.black ,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                             SizedBox(height :10,),
                            CustomTextWidget(text:'الرحلة الحالية' , fontSize: 25, color: Colors.black ),
                            SizedBox(height :10,),
                            Row(
                              children: [
                                SizedBox(width: widthOfScreen/26,),
                                CurrentAndNextLocationWord(isCurrentLocation: true,),
                              ],
                            ),
                            SizedBox(height :10,),
                            Row(
                              children: [
                                SizedBox(width: widthOfScreen/26,),
                                CurrentAndNextLocationWord(isCurrentLocation: false,),
                              ],
                            ),
                            Spacer(),
                            Center(child: InkWell(
                              child: CustomTextWidget(text:'الغاء الطلب' , fontSize: 27, color: Colors.black , fontWeight: FontWeight.w900, ),
                              onTap: () {
                                driverOnTheRoadBottomSheet(context);
                              },)),
                            SizedBox(height :10,)
                              
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
class SmallYellowCircle extends StatelessWidget {
  final Widget child;
  final String text;
  const SmallYellowCircle({super.key, required this.child, required this.text});

  @override
  Widget build(BuildContext context) {
    final heightOfScreen = MediaQuery.of(context).size.height;
      final widthOfScreen = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
            height: heightOfScreen*0.06,
            width: heightOfScreen*0.06,
           decoration: BoxDecoration(
            borderRadius:  BorderRadius.all(Radius.circular(50) ),
            color: ColorManager.yellow,),
            child: Center(child: child),
                                      ),
            SizedBox(height :7,),

            CustomTextWidget(text:text , fontSize: 14, color: Colors.black )

      ],
    )
;
  }
}