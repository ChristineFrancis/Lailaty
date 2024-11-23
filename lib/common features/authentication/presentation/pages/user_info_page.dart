import 'dart:ui_web';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  int _clickCount = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double horizontalOffset;
    double verticalOffset;
    double scale;
    double imgOpacity = 0.5;
    // Adjust parameters based on click count
    switch (_clickCount) {
      case 1:
        horizontalOffset = 0.20;
        verticalOffset = 0.4;
        scale = 1.5;
        break;
      case 2:
        horizontalOffset = -0.75;
        verticalOffset = 0.4;
        scale = 1.5;
        break;
      case 3:
        imgOpacity = 1;
        horizontalOffset = 0.25;
        verticalOffset = 0.15;
        scale = 0.35;
        break;
      default:
        horizontalOffset = 1.2;
        verticalOffset = 0.4;
        scale = 1.5;
    }

    // Animation duration
    const Duration animationDuration = Duration(milliseconds: 800);

    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: Stack(
        children: [
          // Background image with animated position and scaling
          AnimatedPositioned(
            duration: animationDuration,
            curve: Curves.easeOut,
            left: MediaQuery.of(context).size.width * -horizontalOffset,
            top: MediaQuery.of(context).size.height * verticalOffset,
            child: AnimatedScale(
              duration: animationDuration,
              curve: (_clickCount == 3) ? Curves.easeOut : Curves.easeIn,
              scale: scale, // Apply dynamic scaling
              //! my image
              child: SvgPicture.asset(
                ImageAssetManager.lailatyArabic, // Updated image asset path
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(imgOpacity), BlendMode.modulate),
                width: MediaQuery.of(context).size.width * 1.5,
              ),
            ),
          ),
          
          // Centered content based on _clickCount
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Default "HI" text
                  if (_clickCount == 0)
                    Text(
                      "HI",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  // TextFormField when _clickCount == 1
                  if (_clickCount == 1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: 'Enter something',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  // Elevated button when _clickCount == 2
                  if (_clickCount == 2)
                    ElevatedButton(
                      onPressed: () {
                        // Button action (for now just print the input)
                        print("Button clicked");
                      },
                      child: Text('Click Me'),
                    ),
                  // Stack when _clickCount == 3
                  if (_clickCount == 3)
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Text widget on top
                        Positioned(
                          top: -40, // Position the text above the form
                          child: Text(
                            "HI",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // TextFormField below the text
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              labelText: 'Enter something',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        // Elevated button below everything
                        ElevatedButton(
                          onPressed: () {
                            print("Button clicked");
                          },
                          child: Text('Click Me'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          
          // Bottom button to increment _clickCount
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child:CustomElevatedButton(text: "تحقق", onPressed: (){setState(() {
                    if (_clickCount < 3) {
                      _clickCount++;
                    }
                  });})
            ),
          ),
        ],
      ),
    );
  }
}
