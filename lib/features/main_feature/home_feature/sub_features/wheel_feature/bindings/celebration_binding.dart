
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/prize_won_controller.dart';
import 'package:get/get.dart';
class CelebrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CelebrationController());
  }
}
