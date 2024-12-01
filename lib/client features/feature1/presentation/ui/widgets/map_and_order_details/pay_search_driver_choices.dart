import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';

class PayAndySearchDriverAndChoices extends StatelessWidget {

  const PayAndySearchDriverAndChoices({super.key});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 4,),
            SvgPicture.asset(ImageAssetManager.moneyIcon),
           Spacer(flex: 3,),
            SizedBox(
              //height: 50,
              width:widthOfScreen/3 ,
              child: CustomButton(textButton: 'بحث عن سائق',textSize: 15,
                    onTap: () {},
                          ),
                  ),
                  Spacer(flex: 1,),
            //SizedBox(width: widthOfScreen/12), 
            SizedBox(
            width:widthOfScreen/3 ,
           // height: 50, 
            child: 
            CustomButton(
            textButton: 'بحث عن ليدي',textSize: 15,
            onTap: () {},
                  ),
              ),
              Spacer(flex: 3,),
            SvgPicture.asset(ImageAssetManager.choicesIcon),
            Spacer(flex: 4,),
              ],
           );
  }
}