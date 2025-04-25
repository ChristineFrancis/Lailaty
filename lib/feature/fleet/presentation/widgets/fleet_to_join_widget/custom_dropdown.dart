import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/config/presentation/widget/alerts/problem_dialog.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/get_all_fleets/get_all_fleets_bloc.dart';

class CustomDropdown extends StatefulWidget {
  final String? selectedFleetName;
  final void Function(String)? onSelect;
  const CustomDropdown({super.key, this.selectedFleetName, this.onSelect});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isLoading = false;
  bool _hasError = false;

  @override
  void didUpdateWidget(CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedFleetName != null &&
        widget.selectedFleetName != _selectedItem) {
      setState(() {
        _selectedItem = widget.selectedFleetName!;
      });
    }
  }

  void _toggleDropdown(List<String> items) {
    if (_isDropdownOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry(items);
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  OverlayEntry _createOverlayEntry(List<String> items) {
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
              children: items.map((item) {
                return ListTile(
                  title: Text(item, textAlign: TextAlign.right),
                  onTap: () {
                    setState(() {
                      _selectedItem = item;
                      _toggleDropdown(items);
                    });
                    if (widget.onSelect != null) {
                      widget.onSelect!(item);
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  void _showProblemDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ProblemDialog(message: message);
      },
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
      child: BlocBuilder<GetAllFleetsBloc, GetAllFleetsState>(
        builder: (context, state) {
          List<String> fleetNames = [];

          if (state is GetAllFleetsLoading) {
            _isLoading = true;
            _hasError = false;
          } else if (state is GetAllFleetsFailure) {
            _isLoading = false;
            _hasError = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _showProblemDialog(state.errorMessage);
            });
          } else if (state is GetAllFleetsSuccess) {
            fleetNames =
                state.getAllFleetEntity.map((e) => e.office.name).toList();
            _isLoading = false;
            _hasError = false;
          }

          return GestureDetector(
            onTap: () {
              if (_isLoading) return;
              if (fleetNames.isNotEmpty) {
                _toggleDropdown(fleetNames);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'لا يوجد بيانات متاحة حالياً',
                      textAlign: TextAlign.right,
                    ),
                  ),
                );
              }
            },
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
                    _isDropdownOpen
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: ColorManager.grey1,
                  ),
                  Expanded(
                    child: _isLoading
                        ? const Text('جارٍ تحميل...',
                            textAlign: TextAlign.center)
                        : _hasError || fleetNames.isEmpty
                            ? const SizedBox()
                            : Text(
                                _selectedItem ?? "اختر اسم الأسطول",
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
          );
        },
      ),
    );
  }
}
