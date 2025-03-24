import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

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

  Future<void> _searchLocation() async {
    setState(() => _isLoading = true);
    String query = widget.controller.text.trim();

    if (query.isEmpty) {
      _showError("Enter an address first!");
      setState(() => _isLoading = false);
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
            "https://nominatim.openstreetmap.org/search?format=json&q=$query"),
      );

      if (response.statusCode == 200) {
        List<dynamic> results = jsonDecode(response.body);

        if (results.isEmpty) {
          _showError("No results found!");
        } else {
          setState(() {
            searchResults = results;
          });
        }
      } else {
        _showError("API Error: ${response.statusCode}");
      }
    } catch (e) {
      _showError("Search failed.");
    }

    setState(() => _isLoading = false);
  }

  void _onSelectLocation(dynamic result) {
    final lat = double.parse(result['lat']);
    final lon = double.parse(result['lon']);

    // Update text field
    widget.controller.text = result['display_name'];

    // Print lat/lon
    print("📍 Selected Location: $lat, $lon");

    // Send lat/lon to parent widget
    widget.onLocationSelected(lat, lon);

    // Clear search results
    setState(() => searchResults.clear());
  }

//? geolocator :

  // Future<void> _convertAddressToLatLng() async {
  //   print("🔍 Searching for address: ${widget.controller.text}");

  //   setState(() => _isLoading = true);

  //   String address = widget.controller.text.trim(); // Remove extra spaces

  //   if (address.isEmpty) {
  //     _showError("⚠️ Please enter an address before searching!");
  //     setState(() => _isLoading = false);
  //     return;
  //   }

  //   try {
  //     // 🔴 Remove any unexpected characters (except commas, letters, and numbers)
  //     String formattedAddress = address.replaceAll(RegExp(r"[^\w\s,.-]"), "");
  //     print(" Formatted Address: $formattedAddress");

  //     List<Location>? locations;

  //     try {
  //       locations = await locationFromAddress(formattedAddress);
  //     } catch (e) {
  //       print("❌ Internal Geocoding Error: $e"); // Debugging
  //       _showError("Failed to convert address to location.");
  //     }

  //     if (locations == null || locations.isEmpty) {
  //       _showError(" Address not found. Try a more specific one!");
  //     } else {
  //       double lat = locations.first.latitude;
  //       double lng = locations.first.longitude;
  //       widget.onLocationSelected(lat, lng);
  //       print("📍 Location Found: $lat, $lng");
  //     }
  //   } catch (e) {
  //     print("❌ Geocoding Error: $e"); // Debugging
  //     _showError("Failed to get location: ${e.toString()}");
  //   }

  //   setState(() => _isLoading = false);
  // }

  // Future<void> getCoordinates() async {
  //   try {
  //     String address = "1600 Amphitheatre Parkway, Mountain View, CA";

  //     List<Location> locations = await locationFromAddress(address);
  //     print(
  //         "📍 Latitude: ${locations.first.latitude}, Longitude: ${locations.first.longitude}");
  //   } catch (e) {
  //     print("❌ Error: $e");
  //   }
  // }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: const TextStyle(color: ColorManager.whiteColor)),
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

          // Address Input Field
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
            child: TextField(
              textAlign: TextAlign.right,
              keyboardType: widget.keyboardType,
              controller: widget.controller,
              cursorColor: ColorManager.grey1,
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
                        icon: const Icon(
                          Icons.search,
                          color: ColorManager.blackColor,
                        ),
                        onPressed: _isLoading
                            ? null
                            : _searchLocation //_convertAddressToLatLng, //getCoordinates,

                        ),

                //  hintText: hintText,
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
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: ColorManager.errorColor, width: 1.5),
                ),
              ),
            ),
          ),

          // Show search results below the input
          if (searchResults.isNotEmpty)
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final result = searchResults[index];
                  return ListTile(
                    title: Text(result['display_name']),
                    onTap: () {
                      _onSelectLocation(result);
                    },
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
