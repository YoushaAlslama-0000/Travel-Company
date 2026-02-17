// lib/core/data/models/flight_model.dart
class FlightModel {
  final String flightNumber;
  final String departureCity;
  final String arrivalCity;
  final String departureTime;
  final String arrivalTime;
  final String duration;
  final String stopOver;
  final String date;

  FlightModel({
    required this.flightNumber,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.stopOver,
    required this.date,
  });
}
