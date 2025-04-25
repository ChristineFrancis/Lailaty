import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/config/presentation/widget/alerts/problem_dialog.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/bloc/get_searched_fleet_bloc.dart';

class SearchContainer extends StatefulWidget {
  final void Function(String) onSearchSuccess;
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
  late TextEditingController _controller;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<String> _suggestions = [];

  @override
  void initState() {
    _controller = TextEditingController(text: widget.searchText);
    super.initState();
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
    super.dispose();
  }

  void _performSearch() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<GetSearchedFleetBloc>().add(
            RequestForSearchFleet(parameter: text),
          );
    }
  }

  void _showOverlay(List<String> suggestions) {
    _suggestions = suggestions;

    _overlayEntry = _createOverlayEntry(suggestions);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _selectFleet(String name) {
    widget.onSearchSuccess(name);
    _controller.clear();
    _removeOverlay();
  }

  OverlayEntry _createOverlayEntry(List<String> suggestions) {
    double offsetX = context.screenWidth * 0.1;
    double offsetY = context.screenHeight * 0.09;

    return OverlayEntry(
      builder: (context) => Positioned(
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
                  title: Text(item, textAlign: TextAlign.right),
                  onTap: () => _selectFleet(item),
                );
              }).toList(),
            ),
          ),
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
          _showOverlay(
              state.getAllFleetEntity.map((e) => e.office.name).toList());
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
