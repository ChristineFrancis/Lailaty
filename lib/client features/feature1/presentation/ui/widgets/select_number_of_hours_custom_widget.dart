// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/map_and_order_details/sections/journey_in_car_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class SelectNumberOfHoursCustomWidget extends StatefulWidget {
  final List<HoursAndPrice> hoursAndPrice; // List of cities passed via the constructor
  const SelectNumberOfHoursCustomWidget({super.key, required this.hoursAndPrice});

  @override
  _SelectNumberOfHoursCustomWidgetState createState() => _SelectNumberOfHoursCustomWidgetState();
}

class _SelectNumberOfHoursCustomWidgetState extends State<SelectNumberOfHoursCustomWidget> {
  late HoursAndPrice selectedValue;
  //late String price;
   

  @override
  void initState() {
    super.initState();
    // Set the default selected city to the first city in the list
    selectedValue = widget.hoursAndPrice.first;
    //price= widget.hoursAndPrice.first.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl, // Arabic text direction
      child: Container(
        width:  screenWidth * 0.8,
        height: screenHeight * 0.05,
        //margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/5),
       // padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black , width: 2),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Fixed flag on the left
            CustomTextWidget(text: '  عدد الساعات:', color: Colors.black,
            fontSize:getResponsiveText(14, context),
            fontWeight:FontWeight.w500 ),
            DropdownButtonHideUnderline(
              child: DropdownButton<HoursAndPrice>(
                focusColor: Colors.white,
                dropdownColor:Colors.white ,
                icon: const Icon(Icons.arrow_drop_down_sharp , color: Colors.black, size:35,),
                value: selectedValue,
                onChanged: (HoursAndPrice? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: widget.hoursAndPrice.map<DropdownMenuItem<HoursAndPrice>>((hoursAndPrice) {
                  return DropdownMenuItem<HoursAndPrice>(
                    value: hoursAndPrice,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: CustomTextWidget(text:'${hoursAndPrice.hours}ساعة مقابل ${hoursAndPrice.price} EGP ', color: Colors.black,fontSize: 14,fontWeight:FontWeight.w400 )),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

