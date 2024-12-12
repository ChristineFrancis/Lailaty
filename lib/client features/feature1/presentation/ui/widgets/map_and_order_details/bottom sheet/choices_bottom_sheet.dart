import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future choicesBottomSheet(BuildContext context, TextEditingController controller) {
  bool switchValue = false;
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
                  height: heightOfScreen / 2.5,
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
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Close the bottom sheet
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: CustomTextWidget(
                                  text: 'الخيارات',
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                        
                                    CustomTextWidget(
                                      text: 'اكثر من 4 ركاب',
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                    
                                    Switch(
                                      value: switchValue,
                                      onChanged: (value) {
                                        setState(() {
                                          switchValue = value;
                                        });
                                      },
                                      inactiveTrackColor: ColorManager.grey,
                                      inactiveThumbColor: ColorManager.yellow,
                                      activeColor: ColorManager.yellow,
                                      hoverColor: ColorManager.yellow,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(flex: 1,),
                              CustomTextWidget(
                                text: 'اترك ملاحظتك اذا كنت تريد',
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              Spacer(flex: 1,),
                              CustomTextFormFieldName(
                                controller: controller,
                                hintText: '',
                               heightTextFormField: heightOfScreen/8,
                                isArabic: true,
                                maxLines: 5,
                                textAlign:TextAlign.right ,
                              ),
                              Spacer(flex: 1,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: widthOfScreen/4),
                              child: CustomButton(textButton: 'إغلاق', onTap: () {Navigator.pop(context); },),
                            ),
                          
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
