import 'package:lailaty/core/resources/string_manager.dart';

class ClientTripDetailsModel {
  final String title;
  final String cashType;
  final String tripType;
  final String dateTime;
  final String city1;
  final String city2;
  final String captainName;
  final String elapsedTimeExample;
  ClientTripDetailsModel({
    required this.title,
    required this.cashType,
    required this.tripType,
    required this.dateTime,
    required this.city1,
    required this.city2,
    required this.captainName,
    required this.elapsedTimeExample,
  });
}

List<ClientTripDetailsModel> getClientTripDetails() {
  return [
    ClientTripDetailsModel(
      title: StringManager.tripFareDetails,
      cashType: StringManager.cash,
      tripType: StringManager.privateTrip,
      dateTime: StringManager.dateTimeExample,
      city1: StringManager.alexandriaStreetExample,
      city2: StringManager.alexandriaStreetExample,
      captainName: StringManager.exampleCaptainName,
      elapsedTimeExample: StringManager.elapsedTimeExample,
    ),
    ClientTripDetailsModel(
      title: StringManager.tripFareDetails,
      cashType: StringManager.cash,
      tripType: StringManager.privateTrip,
      dateTime: StringManager.dateTimeExample,
      city1: StringManager.alexandriaStreetExample,
      city2: StringManager.alexandriaStreetExample,
      captainName: 'mo',
      elapsedTimeExample: StringManager.elapsedTimeExample,
    ),
    ClientTripDetailsModel(
      title: StringManager.tripFareDetails,
      cashType: StringManager.cash,
      tripType: StringManager.privateTrip,
      dateTime: StringManager.dateTimeExample,
      city1: StringManager.alexandriaStreetExample,
      city2: StringManager.alexandriaStreetExample,
      captainName: 'dd',
      elapsedTimeExample: StringManager.elapsedTimeExample,
    ),
  ];
}
