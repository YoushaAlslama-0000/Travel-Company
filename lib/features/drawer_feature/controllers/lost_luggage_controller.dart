import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LostLuggageController extends GetxController {
  RxInt selectedBagSize = 1.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final messageDate = TextEditingController();
  final fromField = TextEditingController();
  final toField = TextEditingController();
  final messageNumber = TextEditingController();
  final ticketNumber = TextEditingController();
  final luggageReceipt = TextEditingController();
  final luggageColor = TextEditingController();
  final notes = TextEditingController();
  final phone = TextEditingController();

  void setBagSize(int index) => selectedBagSize.value = index;

  void submit() {
    Get.snackbar(
      "تم الإرسال",
      "تم تقديم الطلب بنجاح",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
