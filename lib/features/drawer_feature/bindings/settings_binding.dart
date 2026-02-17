import 'package:flight_app/features/drawer_feature/controllers/setting_controller.dart';
import 'package:get/get.dart';
class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
