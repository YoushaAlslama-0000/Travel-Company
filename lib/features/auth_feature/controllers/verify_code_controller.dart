import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class VerifyCodeController extends GetxController {
  var email = "".obs;

  TextEditingController pinController = TextEditingController();

  /// عدّاد الوقت لإعادة إرسال الكود
  var canResend = true.obs;
  var countdown = 0.obs;

  Timer? timer;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null && Get.arguments['email'] != null) {
      email.value = Get.arguments['email'];
    }

    canResend.value = true;
  }

  ///  لإعادة إرسال الكود
  void resendCode() {
    if (!canResend.value) return;

    canResend.value = false;
    countdown.value = 30; // مدة الانتظار قبل السماح بإعادة الإرسال (بالثواني)

    // بدء عدّ تنازلي
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        canResend.value = true;
        t.cancel();
      }
    });

    Get.snackbar(
      "تم الإرسال",
      "تم إرسال رمز التحقق الجديد إلى بريدك الإلكتروني",
      colorText: AppColors.whiteColor,
      backgroundColor: AppColors.mainColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
