import 'package:flutter/material.dart';

class SearchWithTextFormField extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final void Function(String) onItemSelected;

  const SearchWithTextFormField({
    super.key,
    required this.items,
    required this.hintText,
    required this.onItemSelected,
  });

  @override
  _SearchWithTextFormFieldState createState() =>
      _SearchWithTextFormFieldState();
}

class _SearchWithTextFormFieldState extends State<SearchWithTextFormField> {
  late List<String> filteredItems;
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(widget.items);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _showSuggestions();
      } else {
        _removeSuggestions();
      }
    });
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = List.from(widget.items);
      } else {
        filteredItems = widget.items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
    _showSuggestions();
  }

  void _showSuggestions() {
    _overlayEntry?.remove(); // Remove existing overlay
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeSuggestions() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    return OverlayEntry(
      builder: (context) => Positioned(
        height: size.height,
        width: size.width - 10,
        top: /* renderBox.localToGlobal(Offset.zero).dy + 1*/
            MediaQuery.of(context).size.height * 0.3,
        left: MediaQuery.of(context).size.width * 40 / 430,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index > 0)
                      Container(
                        width: size.width - 77,
                        height: 0.5,
                        color: Colors.black26,
                      ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text(filteredItems[index]),
                        onTap: () {
                          _controller.text = filteredItems[index];
                          widget.onItemSelected(filteredItems[index]);
                          _removeSuggestions();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _removeSuggestions();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.all(14.0),
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          border: Border.all(
              color: _focusNode.hasFocus ? Colors.white : Colors.black,
              width: 1.5),
          borderRadius: BorderRadius.circular(_focusNode.hasFocus ? 12 : 8),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                focusNode: _focusNode,
                controller: _controller,
                onChanged: _filterItems,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
