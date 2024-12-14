import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final Function() onTap;
  final double textSize;
  FontWeight? fontWeight;
  //final double fontSize;
   CustomButton({super.key, required this.textButton, required this.onTap , this.textSize=24 , this.fontWeight} );

  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
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
         child:
         Text(
      textButton,
      style: TextStyle(
        color:  Colors.black,
        fontSize: getResponsiveText(textSize , context), // Font size relative to screen width
        fontWeight:fontWeight ?? FontWeight.bold,
        shadows: [
      Shadow(
        offset: Offset(0.3, 0.2),
        blurRadius: 0.3,
        color: Colors.black,
      ),
    ],
        //fontFamily: "Segeo",
      ),
      textAlign: TextAlign.center, // Optional alignment
    )
         // CustomTextWidget(text: textButton , fontSize: textSize,color: Colors.black , fontWeight:fontWeight)),
                ),
    ));
  }
}