import 'package:flight_app/features/drawer_feature/controllers/select_visa_country_controller.dart';
import 'package:get/get.dart';
class SelectVisaCountryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectVisaCountryController());
  }
}
