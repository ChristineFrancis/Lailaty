// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CurrentAndNextLocationWord extends StatelessWidget {
  String? location;
  final bool isCurrentLocation;
  
   CurrentAndNextLocationWord({
    Key? key,
    this.location, required this.isCurrentLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
      isCurrentLocation? SvgPicture.asset(ImageAssetManager.yallowCircleIcon , height:25 ,)
      :SvgPicture.asset(ImageAssetManager.redCircleIcon ,  height:25),
      //Icon(Icons.circle_outlined, size: 22 , color:isCurrentLocation? ColorManager.yellow : Colors.red,),
      SizedBox(width: 10,),
      CustomTextWidget(text:
      location==null? 
      isCurrentLocation?'الموقع الحالي' :'الموقع التالي' 
      : location!,fontSize: 20 , color: Colors.black),],
                            );
  }
}
