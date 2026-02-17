import 'package:get/get.dart';

class VisaPaymentController extends GetxController {
  final selectedPaymentMethod = Rx<String?>(null);

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }
}
