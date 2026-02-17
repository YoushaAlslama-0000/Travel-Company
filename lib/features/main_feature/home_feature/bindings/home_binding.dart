import 'package:flight_app/features/main_feature/home_feature/controllers/home_controller.dart';
import 'package:flight_app/features/main_feature/main_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MainController()); 
  }
}
