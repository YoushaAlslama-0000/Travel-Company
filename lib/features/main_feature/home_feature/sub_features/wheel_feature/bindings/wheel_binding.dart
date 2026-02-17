import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/wheel_controller.dart';

import 'package:get/get.dart';
class WheelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WheelController());
  }
}
