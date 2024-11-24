import 'package:flutter/material.dart';

class FadeTextSwitcher extends StatefulWidget {
  @override
  _FadeTextSwitcherState createState() => _FadeTextSwitcherState();
}

class _FadeTextSwitcherState extends State<FadeTextSwitcher> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fade Text Switcher")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // First Text Widget
                AnimatedOpacity(
                  opacity: _currentIndex == 0 ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "First Text",
                    style: TextStyle(fontSize: 24, color: Colors.blue),
                  ),
                ),
                // Second Text Widget
                AnimatedOpacity(
                  opacity: _currentIndex == 1 ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "Second Text",
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                ),
                // Third Text Widget
                AnimatedOpacity(
                  opacity: _currentIndex == 2 ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "Third Text",
                    style: TextStyle(fontSize: 24, color: Colors.green),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Cycle through 0, 1, 2
                  _currentIndex = (_currentIndex + 1) % 3;
                });
              },
              child: Text("Switch Text"),
            ),
          ],
        ),
      ),
    );
  }
}
