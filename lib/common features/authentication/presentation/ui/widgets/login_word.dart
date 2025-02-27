import 'package:flutter/material.dart';

class LoginWord extends StatelessWidget {
  const LoginWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'تسجيل الدخول',
      style: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 35,
        shadows: [
          Shadow(
            offset: Offset(0.9, 0.9),
            blurRadius: 0.5,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );

    // const Text(
    //           'تسجيل الدخول',
    //           style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
    //         );
  }
}
