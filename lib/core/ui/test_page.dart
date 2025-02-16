import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 4) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: _currentPage > 0
              ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _previousPage,
                )
              : null,
          title: Text('Page ${_currentPage + 1}'),
        ),
        body: Stack(
          children: [
            Container(
              color: ColorManager.grey,
            ),
            Center(
              child: Container(
                width: screenWidth * 379/430,
                height: screenHeight * 0.8,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) => setState(() => _currentPage = page),
                  children: [
                    Container(
                        color: Colors.blue[900],
                        child: Center(
                            child: Text('Page 1',
                                style: TextStyle(fontSize: 40)))),
                    Container(
                        color: Colors.green[900],
                        child: Center(
                            child: Text('Page 2',
                                style: TextStyle(fontSize: 40)))),
                    Container(
                        color: Colors.orange[900],
                        child: Center(
                            child: Text('Page 3',
                                style: TextStyle(fontSize: 40)))),
                    Container(
                        color: Colors.purple[900],
                        child: Center(
                            child: Text('Page 4',
                                style: TextStyle(fontSize: 40)))),
                    Container(
                        color: Colors.red[900],
                        child: Center(
                            child: Text('Page 5',
                                style: TextStyle(fontSize: 40)))),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 372 / 932,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) => _buildIndicator(index)),
              ),
            ),
            Positioned(
              bottom: screenHeight * 35 / 932,
              left: screenWidth * 67 / 430,
              right: screenWidth * 67 / 430,
              child: CustomButton(
                textButton: 'التالي',
                onTap: _nextPage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color:
            _currentPage == index ? ColorManager.yellow : ColorManager.grey200,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
