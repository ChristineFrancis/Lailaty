import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/travel/data/models/client_trip_details.dart';

class FilterOrderViewModel extends ChangeNotifier {
  List<ClientTripDetailsModel> _allOrders = [];
  List<ClientTripDetailsModel> _filteredOrders = [];
  String _currentFilter = StringManager.onHoldOrders;

  List<ClientTripDetailsModel> get filteredOrders => _filteredOrders;
  String get currentFilter => _currentFilter;

  void initializeOrders(List<ClientTripDetailsModel> orders) {
    _allOrders = orders;
    _filterOrders();
    notifyListeners();
  }

  void _filterOrders() {
    _filteredOrders =
        _allOrders.where((order) => order.status == _currentFilter).toList();
  }

  void updateFilter(String newFilter) {
    _currentFilter = newFilter;
    _filterOrders();
    notifyListeners();
  }
}
