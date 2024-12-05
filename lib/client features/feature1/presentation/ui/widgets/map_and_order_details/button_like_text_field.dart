import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class ButtonLikeTextField extends StatelessWidget {
  final String text;
  final double textSize;
  final Widget suffixWidget;
  final Function() onPressed;
  FontWeight? fontWeight;
  double? heightContainer; 
   ButtonLikeTextField({super.key, required this.text, required this.textSize, required this.suffixWidget,  required this.onPressed , this.fontWeight , this.heightContainer});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height:heightContainer??screenHeight * 0.05,
      decoration: BoxDecoration(
        color:Colors.white ,
        borderRadius:  BorderRadius.all(Radius.circular(10) ),
        border: Border.all(color: Colors.black , width: 2)),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10) ),),
        onPressed: onPressed,
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
          CustomTextWidget(text:text ,fontSize: textSize , color: Colors.black , fontWeight:fontWeight ,), 
           suffixWidget                  
                     ],
          ),
      ),
    );
  }
}