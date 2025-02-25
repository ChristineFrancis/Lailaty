import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;

  final List<String> _items = [
    "الأسطول الأول",
    "الأسطول الثاني",
    "الأسطول الثالث",
  ];

  final LayerLink _layerLink = LayerLink();

  void _toggleDropdown() {
    setState(() {
      if (_isDropdownOpen) {
        _overlayEntry?.remove();
        _overlayEntry = null;
      } else {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry!);
      }
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  OverlayEntry _createOverlayEntry() {
    double offsetX = context.screenWidth * 0.1;
    double offsetY = context.screenHeight * 0.09;
    return OverlayEntry(
      builder: (context) => Positioned(
        width: context.screenWidth * 0.8,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(offsetX, offsetY),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(8),
            color: ColorManager.whiteColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _items.map((item) {
                return ListTile(
                  title: Text(
                    item,
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    setState(() {
                      _selectedItem = item;
                      _toggleDropdown();
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorManager.grey1, width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: ColorManager.grey1,
              ),
              Expanded(
                child: Text(
                  _selectedItem ?? "",
                  textAlign: TextAlign.center,
                  style: StyleManager.semiboldTextStyle20(
                    size: context.screenWidth * 0.04,
                    color: ColorManager.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
