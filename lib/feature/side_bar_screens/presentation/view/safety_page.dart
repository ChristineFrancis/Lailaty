import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class SafetyPage extends StatelessWidget {
  const SafetyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.safety,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            Center(
              child: Icon(
                Icons.verified_user_outlined,
                size: context.screenWidth * 0.5,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Center(
              child: Text(
                StringManager.whoToContact,
                style: StyleManager.boldTextStyle24(),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.12),
              child: Text(
                StringManager.ambulance,
                style: StyleManager.boldTextStyle24(),
              ),
            ),
            Divider(
              color: ColorManager.grey1,
              thickness: 2,
              endIndent: context.screenWidth * 0.12,
              indent: context.screenWidth * 0.12,
            ),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.12),
              child: Text(
                StringManager.police,
                style: StyleManager.boldTextStyle24(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// //! salameh
// import 'package:flutter/material.dart';
// import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';

// import 'package:lailaty/core/resources/color_manager.dart';
// import 'package:lailaty/feature/splash/widgets/custom_text_widget.dart';

// class SafityPage extends StatelessWidget {
//   const SafityPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //double screenHeight = MediaQuery.of(context).size.height;
//     //double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: CustomAppbar(title: 'السلامة',ispop: false,),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 50),
//             Icon(
//               Icons.verified_user_outlined,
//               size: 190,
//               color: ColorManager.grey1,
//             ),
//             SizedBox(height: 20),
//             CustomTextWidget(
//                 text: 'بمن تريد الاتصال؟', fontSize: 35, color: Colors.black),
//             SizedBox(height: 10),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 40),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: CustomTextWidget(
//                         text: 'الإسعاف', fontSize: 35, color: Colors.black),
//                   ),
//                   Divider(
//                     height: 15,
//                     thickness: 1.5,
//                     color: Colors.black,
//                   ),
//                   /*SizedBox(height: 7),
//                   Container(
//                     height: 1.3,
//                     decoration: BoxDecoration(color: Colors.black),
//                   ),
//                   SizedBox(height: 7),*/
//                   InkWell(
//                     onTap: () {},
//                     child: CustomTextWidget(
//                         text: 'الشرطة', fontSize: 35, color: Colors.black),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
