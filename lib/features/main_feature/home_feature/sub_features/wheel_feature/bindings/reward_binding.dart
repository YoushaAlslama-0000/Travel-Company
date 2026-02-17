import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/reward_controller.dart';

import 'package:get/get.dart';
class RewardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RewardsController());
  }
}
