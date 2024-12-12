import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future waysToPayBottomSheet(BuildContext context) {
  Color colorOfButton= ColorManager.grey;
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
             //padding:EdgeInsets.symmetric(horizontal: widthOfScreen/22),
              decoration: BoxDecoration(
                 borderRadius:  BorderRadius.all(Radius.circular(10) ),
                color: ColorManager.grey,
              ),
              height: heightOfScreen /4.5,
              child: Column(
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
                                    Navigator.pop(context); // Close the bottom sheet
                                  },
                                  icon: Icon(Icons.close),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: CustomTextWidget(
                            text:'طرق الدفع',
                            fontSize: 27,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Spacer(flex: 1,),
                        InkWell(
                          onTap: () {
                            if (colorOfButton==ColorManager.grey)
                            {
                               setState(() {
                                   colorOfButton=ColorManager.yellow ;
                                  });
                            }
                            else{
                              setState(() {
                                   colorOfButton=ColorManager.grey ;
                                  });

                            }
                          },
                          child: 
                          Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            height: heightOfScreen /15,
                            color: colorOfButton,
                            child: Row(
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
                          ),
                        ),
                        ),
                         Spacer(flex: 1,),
                ],
              )
            ),
          );
        },
      );
    },
  );
}
