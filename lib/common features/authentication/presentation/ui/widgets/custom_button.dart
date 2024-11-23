import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final Function() onTap;
  final isLarge;
   CustomButton({super.key, required this.textButton, required this.onTap , this.isLarge=true} );

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
         child: Text(textButton , 
          style:TextStyle(color:Colors.black, fontWeight: FontWeight.bold , fontSize:isLarge? 24 : 18, ),),),
                ),
    );
  }
}