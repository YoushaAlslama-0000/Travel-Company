import 'package:get/get.dart';

class PaymentController extends GetxController {
  final selectedPaymentMethod = Rx<String?>(null);

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }
}
