class Flight {
  final String departureCity;
  final String arrivalCity;
  final DateTime departureDate;
  final String departureTime;
  final DateTime arrivalDate;
  final String arrivalTime;
  final double price;
  final String airline;
  final String duration;
  final int availableSeats;

  Flight({
    required this.departureCity,
    required this.arrivalCity,
    required this.departureDate,
    required this.departureTime,
    required this.arrivalDate,
    required this.arrivalTime,
    required this.price,
    required this.airline,
    required this.duration,
    required this.availableSeats,
  });
}
