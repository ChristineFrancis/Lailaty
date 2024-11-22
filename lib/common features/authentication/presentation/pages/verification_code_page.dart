import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class VerificationCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40), // Adjust for top padding
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/lettersLY.png', height: 40), // First image
                Image.asset('assets/lailaty.png', height: 40), // Second image
              ],
            ),
            const SizedBox(height: 16),
            Image.asset('assets/lailatyArabic.png', height: 50), // Third image
            const SizedBox(height: 40),
            const Text(
              'تفقد بريدك الإلكتروني',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Segeo"),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'ارسلنا رمز تحقق الى بريدك الإلكتروني',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: '5 5 5 5 5 5',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.timer, color: Colors.yellow),
                const SizedBox(width: 8),
                const Text(
                  '1:30',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('تحقق', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
