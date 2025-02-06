import 'package:flutter/material.dart';

BottomNavigationBarItem buildBarItem(Widget icon, String label, int index,int currentIndex) {
  return BottomNavigationBarItem(
    icon: Container(
      decoration: currentIndex == index
          ? BoxDecoration(
              color: Colors.yellow, 
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      padding: EdgeInsets.all(8),
      child: icon,
    ),
    label: label,
  );
}
