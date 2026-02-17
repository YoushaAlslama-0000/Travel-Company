import 'package:google_maps_flutter/google_maps_flutter.dart';

class Agent {
  final String id;
  final String name;
  final String address;
  final LatLng position;
  final String distance;
  final String openUntil;
  final String avatarUrl;

  Agent({
    required this.id,
    required this.name,
    required this.address,
    required this.position,
    this.distance = '0.8 ميل',
    this.openUntil = '6:00 مساءً',
    this.avatarUrl =
        'assets/images/home/person.png', // تأكد من وجود صورة بهذا المسار
  });
}
