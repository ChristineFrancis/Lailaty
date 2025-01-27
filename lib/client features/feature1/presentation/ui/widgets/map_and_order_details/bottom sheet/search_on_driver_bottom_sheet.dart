import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

Future<void> searchOnDriverBottomSheet(BuildContext context, TextEditingController controller) {
  bool switchValue = false;
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
              height: heightOfScreen / 3,
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
                                icon: Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: CustomTextWidget(
                            text: 'البحث عن كباتن',
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:  8.0),
                          child: Center(
                            child: CustomTextWidget(
                              text: 'عرضك',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.remove, size: 24, weight: 30),
    ),
    Center(
      child: CustomTextWidget(
        text: '90 EGP',
        fontSize: 24,
        color: Colors.black,
        fontWeight: FontWeight.w900,
      ),
    ),
    Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: ColorManager.yellow,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center( // Ensure the icon is perfectly centered
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, size: 24, color: Colors.black),
        ),
      ),
    ),
  ],
),

                        //Spacer(flex: 1,),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: widthOfScreen/4),
                          child: Center(
                            child: CustomTextFormFieldName(
                              controller: controller,
                              hintText: 'رفع السعر المقترح',
                              heightTextFormField: heightOfScreen*0.06,
                            ),
                          ),
                        ),
                       SizedBox(height: 10,),
                       // Spacer(flex: 1,),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Expanded(
                            child: Row(
                              children: [
                                SvgPicture.asset(ImageAssetManager.automaticAcceptanceIcon),
                                SizedBox(width: widthOfScreen/26,),
                                CustomTextWidget(
                                  text: 'قبول تلقائي لعرض بقيمة EGP 90',
                                  fontSize: 16,
                                  color: ColorManager.yellow,
                                ),
                                SizedBox(width: widthOfScreen/30,),
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
                        ),
                        //Spacer(flex: 3,),
                        SizedBox(height: 10,),
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
