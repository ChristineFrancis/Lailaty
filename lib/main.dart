import 'package:flutter/material.dart';
import 'package:lailaty/core/go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes().router,
      debugShowCheckedModeBanner: false,
    );
  }
}

//! fixing the call us page : >> text <<
//! editing car in the profile page in sidebar <<



//extract EditableButtonField
//some fixes in travel
//some fixes in widding
//suggestYourPrice button and text field
//complete teach driving order
//WhileWaitingContainer
//confirmSuggestedPriceForTripAndRideContainer
//buildSuggestYourFareContainer
//fix the PathsRow