import 'package:get/get.dart';
import '../controllers/visa_process_controller.dart';

class VisaProcessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisaProcessController>(() => VisaProcessController());
  }
}
