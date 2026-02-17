import 'package:flight_app/features/drawer_feature/controllers/visa_application_process_controller.dart';
import 'package:get/get.dart';
class VisaApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisaApplicationController>(
      () => VisaApplicationController(),
    );
  }
}