import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/core/presentation/widget/alerts/problem_dialog.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/get_all_fleets/get_all_fleets_bloc.dart';

class CustomDropdown extends StatefulWidget {
  final String? selectedFleetName;
  final void Function(String, int)? onSelect;
  const CustomDropdown({super.key, this.selectedFleetName, this.onSelect});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late final NetworkInfo _networkInfo;
  StreamSubscription<bool>? _connectionSubscription;

  @override
  void initState() {
    super.initState();
    _networkInfo = sl<NetworkInfo>();

    _connectionSubscription = _networkInfo.connectionStream.listen((connected) {
      if (connected && (_fleets.isEmpty || _hasError)) {
        context.read<GetAllFleetsBloc>().add(RequestAllFleets());
      }
    });
  }

  @override
  void dispose() {
    _removeOverlay();
    _connectionSubscription?.cancel();
    super.dispose();
  }

  String? _selectedItem;
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isLoading = false;
  bool _hasError = false;
  List<GetAllFleetEntity> _fleets = [];

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

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  OverlayEntry _createOverlayEntry() {
    double offsetX = context.screenWidth * 0.1;
    double offsetY = context.screenHeight * 0.09;
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _toggleDropdown();
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              width: context.screenWidth * 0.8,
              child: CompositedTransformFollower(
                link: _layerLink,
                offset: Offset(offsetX, offsetY),
                showWhenUnlinked: false,
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8),
                  color: ColorManager.whiteColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _fleets.map((item) {
                      return ListTile(
                        title:
                            Text(item.office.name, textAlign: TextAlign.right),
                        onTap: () {
                          setState(() {
                            _selectedItem = item.office.name;
                            _toggleDropdown();
                          });
                          if (widget.onSelect != null) {
                            widget.onSelect!(item.office.name, item.office.id);
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
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
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: BlocBuilder<GetAllFleetsBloc, GetAllFleetsState>(
        builder: (context, state) {
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
            _fleets = state.getAllFleetEntity;
            _isLoading = false;
            _hasError = false;
          }

          return GestureDetector(
            onTap: () {
              if (_isLoading) return;
              if (_fleets.isNotEmpty) {
                _toggleDropdown();
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
                        ? const Text('جارٍ التحميل...',
                            textAlign: TextAlign.center)
                        : _hasError || _fleets.isEmpty
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
