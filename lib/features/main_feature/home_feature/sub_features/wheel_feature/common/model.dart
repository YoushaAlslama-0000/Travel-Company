import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/common/enum.dart';


class Prize {
  String name;
  String? expiryDate;
  PrizeType type; // اضفنا نوع الجائزة
  bool isClaimed;

  Prize({
    required this.name,
    this.expiryDate,
    required this.type,
    this.isClaimed = false,
  });
}
