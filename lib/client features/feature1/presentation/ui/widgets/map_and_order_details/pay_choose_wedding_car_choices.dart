// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/choices_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/ways_to_pay_bottom_sheet.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';

class PayChooseWeddingCarChoices extends StatelessWidget {
  final  TextEditingController notesController;

  const PayChooseWeddingCarChoices({
    Key? key,
    required this.notesController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1,),
            InkWell(
              onTap:() async{await waysToPayBottomSheet(context ); } ,
              child: SvgPicture.asset(ImageAssetManager.moneyIcon)),
           Spacer(flex: 2,),
            SizedBox(
              //height: 50,
              width:widthOfScreen/2,
              child: CustomButton(textButton: 'اختر سيارة زفافك',textSize: 19,
                    onTap: () {}, 
                          ),
                  ),
                  Spacer(flex: 2,),
            //SizedBox(width: widthOfScreen/12), 
            
            InkWell
            (onTap:() async{await choicesBottomSheet(context , notesController); } ,
              child: SvgPicture.asset(ImageAssetManager.choicesIcon)),
            Spacer(flex: 1,),
              ],
           );
  }
}
