import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/core/presentation/widget/alerts/problem_dialog.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/bloc/get_searched_fleet_bloc.dart';

class SearchContainer extends StatefulWidget {
  final void Function(String, int) onSearchSuccess;
  final String searchText;
  final void Function(String) onTextChange;

  const SearchContainer({
    super.key,
    required this.onSearchSuccess,
    required this.searchText,
    required this.onTextChange,
  });

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  late final NetworkInfo _networkInfo;
  StreamSubscription<bool>? _subscription;
  bool _isDialogShown = false;

  late TextEditingController _controller;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<GetAllFleetEntity> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.searchText);
    _networkInfo = sl<NetworkInfo>();

    _subscription = _networkInfo.connectionStream.listen((connected) {
      if (!mounted) return;
      if (connected) {
        // Retry search automatically
        if (_controller.text.trim().isNotEmpty) {
          context.read<GetSearchedFleetBloc>().add(
                RequestForSearchFleet(parameter: _controller.text.trim()),
              );
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant SearchContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchText != widget.searchText) {
      _controller.text = widget.searchText;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _removeOverlay();
    _subscription?.cancel();
    super.dispose();
  }

  void _performSearch() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      if (!_isDialogShown) {
        _isDialogShown = true;
        showDialog(
          context: context,
          builder: (_) => const ProblemDialog(
            message: StringManager.noInternetConnection,
          ),
        );
      }
      return;
    }

    context.read<GetSearchedFleetBloc>().add(
          RequestForSearchFleet(parameter: text),
        );
  }

  void _showOverlay(List<GetAllFleetEntity> suggestions) {
    _suggestions = suggestions;
    _overlayEntry = _createOverlayEntry(suggestions);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _selectFleet(String name, int id) {
    widget.onSearchSuccess(name, id);
    _controller.clear();
    _removeOverlay();
  }

  OverlayEntry _createOverlayEntry(List<GetAllFleetEntity> suggestions) {
    double offsetX = context.screenWidth * 0.1;
    double offsetY = context.screenHeight * 0.09;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          _removeOverlay();
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
                    children: suggestions.map((item) {
                      return ListTile(
                        title:
                            Text(item.office.name, textAlign: TextAlign.right),
                        onTap: () => _selectFleet(
                          item.office.name,
                          item.office.id,
                        ),
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetSearchedFleetBloc, GetSearchedFleetState>(
      listener: (context, state) {
        if (state is GetSearchedFleetFailure) {
          _removeOverlay();
          showDialog(
            context: context,
            builder: (_) => ProblemDialog(message: state.errorMessage),
          );
        } else if (state is GetSearchedFleetSuccess) {
          _removeOverlay();
          _showOverlay(state.getAllFleetEntity);
        }
      },
      builder: (context, state) {
        return CompositedTransformTarget(
          link: _layerLink,
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: ColorManager.whiteColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.grey1, width: 2),
            ),
            child: TextField(
              controller: _controller,
              textAlign: TextAlign.right,
              onChanged: widget.onTextChange,
              onSubmitted: (_) => _performSearch(),
              decoration: InputDecoration(
                hintText: StringManager.findTheNameOfTheFleet,
                hintStyle: const TextStyle(color: Colors.grey),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: ColorManager.grey1),
                  onPressed: _performSearch,
                ),
                prefix: state is GetSearchedFleetLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: ColorManager.grey2,
                        ),
                      )
                    : const SizedBox(width: 20, height: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
