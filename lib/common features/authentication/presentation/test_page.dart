import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/Drawer/my_drawer.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      endDrawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: ColorManager.grey,
        actions: [
          IconButton(
              icon: Icon(
                Icons.menu,
                color: ColorManager.yellow,
              ),
              onPressed: () {
                scaffoldkey.currentState!.openEndDrawer();
              }),
        ],
      ),
      body: Center(
        child: Container(
          width: 50,
          height: 50,
          //color: Colors.red,
          child: SvgPicture.asset(ImageAssetManager.facebookLogo),
        ),
      ),
    );
  }
}
