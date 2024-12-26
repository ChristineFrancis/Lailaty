import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Travel Options', style: TextStyle(fontSize: 24)),
            decoration: BoxDecoration(
              color: ColorManager.grey1,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Close drawer and navigate to home page or do some action
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
