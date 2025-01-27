import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future<void> carDetailsBottomSheet(BuildContext context, String image , String name , String details ) {
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
              height: heightOfScreen / 2.5,
              child:  CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                  hasScrollBody: false,
                    child: Column(
                       mainAxisSize: MainAxisSize.min, 
                      children: [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the bottom sheet
                                },
                                icon: SvgPicture.asset(ImageAssetManager.closeIcon),
                              ),
                            ],
                          ),
                        ),
                       
                       
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(image),
                              SizedBox(width: 8,),
                              CustomTextWidget(
                                text: name,
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ],
                          ),
                        ),
                        Spacer(flex: 1,),
                        CustomTextWidget(
                              text: details,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                             Spacer(flex: 1,),

                            CustomTextWidget(
                              text: 'يمكنك اختيار شريك سائق كابتن او ليدي كابتن',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                             Spacer(flex: 1,),
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
