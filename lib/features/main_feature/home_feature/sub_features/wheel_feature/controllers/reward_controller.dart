import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/common/model.dart';

import 'package:get/get.dart';

class RewardsController extends GetxController {
  RxInt totalPoints = 12450.obs;
  RxList<Prize> discountAndGiftCards = <Prize>[].obs;
  RxInt pointsThisMonth = 250.obs; // نقاط هذا الشهر

  void addPoints(int points) {
    totalPoints.value += points;
    pointsThisMonth.value += points; // تحديث نقاط الشهر
  }

  void addCard(Prize reward) {
    discountAndGiftCards.add(reward);
  }
}
