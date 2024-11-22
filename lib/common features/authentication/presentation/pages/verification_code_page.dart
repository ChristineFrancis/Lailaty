import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/widgets/verification_code_page.dart/countdown_timer.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.grey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssetManager.lettersLY,
                ),
                SizedBox(width: 7),
                SvgPicture.asset(
                  ImageAssetManager.lailaty,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SvgPicture.asset(
              ImageAssetManager.lailatyArabic,
            ),
            const SizedBox(height: 40),
            const Text(
              'تفقد بريدك الإلكتروني',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Segeo"),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Text(
              'ارسلنا رمز تحقق الى بريدك الإلكتروني',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 70),
            SizedBox(
              width: 250,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 32), // Adjust font size to cover more space
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5), // Make the field thinner
                  filled: true,
                  fillColor: Colors.white,
                  hintText: '5  5  5  5  5  5',
                  hintStyle: const TextStyle(
                      fontSize: 32,
                      color: Colors.grey), // Hint covers entire field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black, width: 7), // Thicker border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const CountdownTimer(),
            const Spacer(),
            CustomElevatedButton(text: "تحقق", onPressed: () {}),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
