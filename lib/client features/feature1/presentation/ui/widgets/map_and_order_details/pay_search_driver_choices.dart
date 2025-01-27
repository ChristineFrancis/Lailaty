import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/cancel_order_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/evaluate_driver_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/reasons_for_canceling_order_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/choices_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver-accept_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver_waiting_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/driver_waiting_with_button_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/enter_path_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/search_on_driver_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/time_to_arrive_and_evalute_the_trip_bottom_sheet.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/bottom%20sheet/ways_to_pay_bottom_sheet.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';

class PayAndySearchDriverAndChoices extends StatelessWidget {
  final  TextEditingController notesController;

  const PayAndySearchDriverAndChoices({super.key, required this.notesController});

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 4,),
             InkWell(
              onTap:() async{await waysToPayBottomSheet(context ); } ,
              child: SvgPicture.asset(ImageAssetManager.moneyIcon)),
           Spacer(flex: 3,),
            SizedBox(
              //height: 50,
              width:widthOfScreen/3 ,
              child: CustomButton(textButton: 'بحث عن سائق',textSize: 17,
                    onTap: ()async{await
                     searchOnDriverBottomSheet(context , notesController); 
                    //driverAcceptBottomSheet(context);
                    //driverWaitingBottomSheet(context) ;
                    //cancelOrderBottomSheet(context);
                    //cancelOrderBottomSheet(context);
                    //timeToArriveAndEvaluteTheTripBottomSheet(context);
                    //evaluateDriverBottomSheet(context);
                    }
                     
                    
                          ),
                  ),
                  Spacer(flex: 1,),
            //SizedBox(width: widthOfScreen/12), 
            SizedBox(
            width:widthOfScreen/3 ,
           // height: 50, 
            child: 
            CustomButton(
            textButton: 'بحث عن ليدي',textSize: 17,
            onTap: () {}, 
                  ),
              ),
              Spacer(flex: 3,),
            InkWell
            (onTap:() async{await enterYourPathBottomSheet(context , notesController); } ,
              child: SvgPicture.asset(ImageAssetManager.choicesIcon)),
            Spacer(flex: 4,),
              ],
           );
  }
}