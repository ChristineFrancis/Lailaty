import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver-accept_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future driverWaitingBottomSheet(BuildContext context) {
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
                  height: heightOfScreen / 3.5,
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
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      CustomTextWidget(text: 'محمد بانتظارك', fontSize: 17, color: Colors.black ),
                                      CustomTextWidget(text: 'كيا سيراتو سوداء', fontSize: 17, color: Colors.black ),
                                    ],
                                  ),
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