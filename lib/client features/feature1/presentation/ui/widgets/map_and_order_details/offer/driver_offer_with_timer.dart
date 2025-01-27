import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class DriverOfferWithTimer extends StatefulWidget {
  @override
  _DriverOfferWithTimerState createState() => _DriverOfferWithTimerState();
}

class _DriverOfferWithTimerState extends State<DriverOfferWithTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _lineWidth;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _lineWidth = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthOfScreen=MediaQuery.sizeOf(context).width;
    final heightOfScreen=MediaQuery.sizeOf(context).height;
    return Container(
     // width: 300,
     margin: EdgeInsets.symmetric(horizontal:widthOfScreen*0.01 ),
      height:heightOfScreen/6,
      child: Stack(
        children: [
          // Main grey rectangle
          Container(
            decoration: BoxDecoration(
              color: ColorManager.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(16),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    //SizedBox(height: 5),
                    Container(
                      height: heightOfScreen*0.05,
                      width: heightOfScreen*0.05,
                      decoration: BoxDecoration(
                       color: ColorManager.yellow,
                       borderRadius: BorderRadius.circular(50),
            ),
                    ),
                    CustomTextWidget(text: 'محمد', fontSize: 15, color: Colors.black),
                    Row(
                      children: [
                        Icon(Icons.star_border_outlined , color: ColorManager.yellow, size:10  ,),
                        CustomTextWidget(text: '5', fontSize: 10, color: Colors.black),
                      ],
                    ),
                    CustomTextWidget(text: '(40)', fontSize: 10, color: Colors.black),

                  ],
                ),
                SizedBox(width: 15,),
                Column(
                  children: [
                    CustomTextWidget(text: 'Ride', fontSize: 23, color: Colors.black , fontWeight:FontWeight.w900 ,),
                    CustomTextWidget(text: '88 EGP', fontSize: 23, color: Colors.black , fontWeight: FontWeight.w900),
                    Spacer(),
                    // CustomTextWidget(text: 'رفض', fontSize: 26, color: Colors.black),
                    // SizedBox(height: 5,)
                  ],
                ),
                SizedBox(width: 15,),
                Column(
                  children: [
                    CustomTextWidget(text: '3دقيقة ', fontSize: 11, color: Colors.white),
                    CustomTextWidget(text: '500 متر', fontSize: 11, color: Colors.white),
                    Spacer(),
                    Row(
                      children: [
                        CustomTextWidget(text: 'رفض', fontSize: 26, color: Colors.black),
                         SizedBox(width: 15,),
                        SizedBox(
                          width: widthOfScreen/3,
                          child: CustomButton(textButton: 'قبول', 
                          onTap: () {
                            
                          },),
                        ),
                      ],
                    )


                  ],
                )
                
                
              ],
            ),
          ),
          
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _lineWidth,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 5,
                    width: 300 * _lineWidth.value,
                    color: ColorManager.yellow,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
