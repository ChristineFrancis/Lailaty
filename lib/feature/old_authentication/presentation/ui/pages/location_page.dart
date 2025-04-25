// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lailaty/core/resources/asset_manager.dart';
// import 'package:lailaty/core/resources/color_manager.dart';
// import 'package:lailaty/feature/old_authentication/presentation/ui/pages/register_with_email_page.dart';
// import 'package:lailaty/feature/old_authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
// import 'package:lailaty/feature/old_authentication/presentation/ui/widgets/custom_button.dart';
// import 'package:lailaty/feature/old_authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
// import 'package:lailaty/feature/old_authentication/presentation/ui/widgets/login_word.dart';

// class LocationPage extends StatelessWidget {
//   const LocationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: ColorManager.grey1,
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: ColorManager.yellowTextColor,
//               )),
//         ),
//         backgroundColor: ColorManager.grey1,
//         body: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.sizeOf(context).width / 45,
//           ),
//           child: Column(
//             children: [
//               Spacer(
//                 flex: 1,
//               ),
//               LoginWord(),
//               Spacer(
//                 flex: 3,
//               ),
//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   final imageHeight = constraints.maxWidth / 2.3;
//                   return Directionality(
//                     textDirection: TextDirection.ltr,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         LailatyArabicAndEnglish(),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         Container(
//                           width: 3, // Width of the yellow line
//                           height: imageHeight, // Match the height of the image
//                           color: ColorManager.yellowTextColor,
//                         ),
//                         SizedBox(
//                           width: 6,
//                         ),
//                         SvgPicture.asset(
//                           ImageAssetManager.location,
//                           width: imageHeight, // Set the width of the image
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               Spacer(
//                 flex: 3,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: MediaQuery.sizeOf(context).width / 20),
//                 child: CustomTextWidget(
//                   text: 'هل تود السماح لتطبيق ليلتي بتتبع موقعك',
//                   color: Colors.black,
//                   fontSize: 26,
//                 ),
//               ),
//               //SizedBox(height: 20,),
//               //Spacer(flex: 1,),

//               //CityDropdown(),

//               Spacer(
//                 flex: 3,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.sizeOf(context).width / 7,
//                 ),
//                 child: CustomButton(
//                     textButton: 'السماح',
//                     textSize: 25,
//                     onTap: () {
//                       Navigator.of(context).push(PageRouteBuilder(
//                         pageBuilder: (context, animation, secondaryAnimation) =>
//                             RegisterWithEmailPage(),
//                       ));
//                     }),
//               ),
//               TextButton(
//                 child: CustomTextWidget(
//                     text: 'ليس الان', color: ColorManager.yellowTextColor, fontSize: 25),
//                 onPressed: () {},
//               ),
//               Spacer(
//                 flex: 2,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
