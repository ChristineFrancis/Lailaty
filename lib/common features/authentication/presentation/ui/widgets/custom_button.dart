import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final Function() onTap;
  final double textSize;
   CustomButton({super.key, required this.textButton, required this.onTap , this.textSize=24} );

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,           
      decoration: const BoxDecoration(
       color: ColorManager.yellow,
       borderRadius:  BorderRadius.all(Radius.circular(10) )),
      child: MaterialButton(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all( Radius.circular(10))) ,
        onPressed:onTap ,
        child: Center(
         child: CustomTextWidget(text: textButton , fontSize: textSize,)),
                ),
    );
  }
}