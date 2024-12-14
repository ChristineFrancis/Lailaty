import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => '...ادخل نوع السيارة التي تريدها';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {}, icon: Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("");
  }
}
