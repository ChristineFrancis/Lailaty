import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver-accept_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver_on_the_road_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/current_and_next_location_word.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future evaluateDriverBottomSheet(BuildContext context) {
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
                  height: heightOfScreen / 1.2,
                  child: Directionality(
                          textDirection: TextDirection.rtl,
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                         hasScrollBody: true,
                          child: Column(
                            mainAxisSize: MainAxisSize.min, 
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height :10,),
                              Row(
                                children: [
                                  Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                                  height: heightOfScreen*0.09,
                                                  width: heightOfScreen*0.09,
                                                 decoration: BoxDecoration(
                                                  borderRadius:  BorderRadius.all(Radius.circular(50) ),
                                                  color: ColorManager.yellow,),
                                                  
                                              ),
                                              CustomTextWidget(text:'محمد', fontSize: 22, color: ColorManager.yellow)
                                    ],
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(height :10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                    Column(
                                      children: [
                                        //SvgPicture.asset(ImageAssetManager.rideCar),
                                        CustomTextWidget(text:'182' , fontSize: 18, color: Colors.black ),
                                        CustomTextWidget(text:'رحلة' , fontSize: 18, color: Colors.black ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        //SvgPicture.asset(ImageAssetManager.rideCar),
                                        Row(
                                          children: [
                                            CustomTextWidget(text:'4,95' , fontSize: 18, color: Colors.black ),
                                            Icon(Icons.star_outline , color:ColorManager.yellow ,)
                                          ],
                                        ),
                                        CustomTextWidget(text:'التقييم' , fontSize: 18, color: Colors.black ),
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
                              CustomTextWidget(text:'المراجعات' , fontSize: 22, color: Colors.black ),
                              SizedBox(height :10,),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    
                                    
                                    Column(
                                      children: [
                                        SvgPicture.asset(ImageAssetManager.politIcon , ),
                                        CustomTextWidget(text: 'سائق مهذب', fontSize: 15, color: Colors.black)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SvgPicture.asset(ImageAssetManager.timerIcon , ),
                                        CustomTextWidget(text:'وصول سريع ', fontSize:15, color: Colors.black)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SvgPicture.asset(ImageAssetManager.safetyIcon ,),
                                        CustomTextWidget(text: 'قيادة امنة', fontSize: 15, color: Colors.black)
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SvgPicture.asset(ImageAssetManager.carIcon ,),
                                        CustomTextWidget(text:'سيارة لطيفة', fontSize: 15, color: Colors.black)
                                      ],
                                    ),
        
                                    
                                  ],
                                ),
                              ),
                              SizedBox(height :10,),
                              CustomTextWidget(text:'اهم المراجعات' , fontSize: 25, color: Colors.black ),
                              SizedBox(height :3,),
                              Row(
                              children: [
                                Icon(Icons.star_outline , color:ColorManager.yellow ,),
                                Icon(Icons.star_outline , color:ColorManager.yellow ,),
                                Icon(Icons.star_outline , color:ColorManager.yellow ,),
                                Icon(Icons.star_outline , color:ColorManager.yellow ,),
                                Icon(Icons.star_outline , color:ColorManager.yellow ,)
                                
                              ],
                            ),
                             SizedBox(height :3,),
                            CustomTextWidget(text:'موسقى جيدة' , fontSize: 18, color: Colors.black ),
                            SizedBox(height :3,),
                            CustomTextWidget(text:'-منذ 3 أيام محمد' , fontSize: 15, color: Colors.black ),
            
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