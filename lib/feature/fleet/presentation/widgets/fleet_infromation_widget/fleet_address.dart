import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/resources/url_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:geocoding/geocoding.dart';

class FleetAddressContainer extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final TextInputType keyboardType;
  final Function(double, double) onLocationSelected;

  const FleetAddressContainer({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.onLocationSelected,
  });

  @override
  State<FleetAddressContainer> createState() => _FleetAddressContainerState();
}

class _FleetAddressContainerState extends State<FleetAddressContainer> {
  bool _isLoading = false;
  List<dynamic> searchResults = [];
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onTextChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.trim().isNotEmpty) {
        _searchLocation(query);
      } else {
        setState(() => searchResults.clear());
      }
    });
  }

  // البحث عن الموقع باستخدام OpenStreetMap أولاً وإذا فشل استخدام geocoding كبديل.
  Future<void> _searchLocation(String query) async {
    setState(() => _isLoading = true);

    try {
      // محاولة البحث باستخدام OpenStreetMap
      final response = await http.get(
        Uri.parse("${UrlManager.openStreetMapSearch}$query"),
      );

      if (response.statusCode == 200) {
        List<dynamic> results = jsonDecode(response.body);
        if (results.isNotEmpty) {
          // إذا تم العثور على نتائج من OpenStreetMap
          setState(() {
            searchResults = results;
          });
        } else {
          // إذا لم يتم العثور على نتائج من OpenStreetMap، استخدم geocoding كبديل
          _searchLocationWithGeocoding(query);
        }
      } else {
        // في حال فشل البحث في OpenStreetMap
        _searchLocationWithGeocoding(query);
      }
    } catch (e) {
      // في حال فشل الاتصال بـ OpenStreetMap، نستخدم geocoding كبديل
      _searchLocationWithGeocoding(query);
    }

    setState(() => _isLoading = false);
  }

  Future<void> _searchLocationWithGeocoding(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        setState(() {
          searchResults = locations.map((location) {
            return {
              'display_name': query,
              'lat': location.latitude.toString(),
              'lon': location.longitude.toString(),
            };
          }).toList();
        });
      } else {
        _showError(StringManager.searchFailed);
      }
    } catch (e) {
      _showError(StringManager.searchFailed);
    }
  }

  void _onSelectLocation(dynamic result) {
    final lat = double.parse(result['lat']);
    final lon = double.parse(result['lon']);

    widget.controller.text = result['display_name'];
    widget.onLocationSelected(lat, lon);

    setState(() => searchResults.clear());
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: ColorManager.whiteColor),
          textAlign: TextAlign.right,
        ),
        backgroundColor: ColorManager.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: context.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(
            bottom: BorderSide(width: 2, color: ColorManager.shadowColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(widget.title,
              style: StyleManager.boldTextStyle24(
                  size: context.screenWidth * 0.05)),
          SizedBox(height: context.screenHeight * 0.02),

          /// Address Input Field with Search Icon
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
            child: TextField(
              textAlign: TextAlign.right,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              cursorColor: ColorManager.grey1,
              onChanged: _onTextChanged,
              decoration: InputDecoration(
                prefixIcon: _isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: ColorManager.grey1,
                        ),
                      )
                    : IconButton(
                        icon: const Icon(Icons.search,
                            color: ColorManager.blackColor),
                        onPressed: () =>
                            _searchLocation(widget.controller.text.trim()),
                      ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: ColorManager.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: ColorManager.grey1, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: ColorManager.grey1, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: ColorManager.grey1, width: 1.5),
                ),
              ),
            ),
          ),

          /// Search Results Dropdown
          if (searchResults.isNotEmpty)
            Container(
              height: 200,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final result = searchResults[index];
                  return ListTile(
                    title: Text(result['display_name']),
                    onTap: () => _onSelectLocation(result),
                  );
                },
              ),
            ),

          SizedBox(height: context.screenHeight * 0.02),
        ],
      ),
    );
  }
}
