
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/common/enum.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/common/model.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/reward_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/wheel_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/views/reward_view.dart';
import 'package:get/get.dart';
class CelebrationController extends GetxController {
  final wheelController = Get.find<WheelController>();
  final rewardsController = Get.find<RewardsController>();

  Rx<Prize?> currentReward = Rxn<Prize>();
  Rx<PrizeType> prizeType = Rx<PrizeType>(PrizeType.POINTS);

  @override
  void onInit() {
    super.onInit();
    currentReward.value = wheelController.currentReward.value;
    if (currentReward.value != null) {
      prizeType.value = currentReward.value!.type;
    }
  }

  void addReward() {
    if (currentReward.value != null) {
      if (currentReward.value!.type == PrizeType.POINTS) {
        final points = int.parse(
          currentReward.value!.name.replaceAll(' نقطة', ''),
        );
        rewardsController.addPoints(points);
      } else {
        rewardsController.addCard(currentReward.value!);
      }
      wheelController.currentReward.value=null; // مسح الجائزة المؤقتة
      Get.to(RewardsView()); // الرجوع لصفحة الجوائز
    }
  }
}
