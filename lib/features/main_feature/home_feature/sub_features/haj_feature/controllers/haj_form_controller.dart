import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HajjAppController extends GetxController {
  /// -------------------------------
  ///  الحالة الخاصة بواجهة دليل الحج
  /// -------------------------------

  /// الخطوة الحالية (مثل الخطوات التي ظهرت في التصميم)
  final RxInt currentStep = 0.obs;

  /// نوع الرحلة (برّي / جوي / حملة)
  final RxInt selectedTripType = 0.obs;

  /// هل رفع المستخدم صورة الجواز؟
  final RxBool passportUploaded = false.obs;

  /// هل رفع المستخدم بطاقة الهوية؟
  final RxBool idCardUploaded = false.obs;

  /// هل لديه محل (تيولا) أو لا
  var hasTulaStore = Rxn<bool>();

  /// نوع المستخدم (طبيعي / تجاري)
  var selectedUserType = UserType.natural.obs;

  /// -------------------------------
  ///  حقول الإدخال
  /// -------------------------------
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameController = TextEditingController();
  final emailNaturalController = TextEditingController();

  /// -------------------------------
  ///  دوال التحكم بالواجهة
  /// -------------------------------

  /// تغيير نوع الرحلة
  void setTripType(int index) {
    selectedTripType.value = index;
  }

  /// يحدد ما إذا كان لدى المستخدم متجر
  void selectTulaStore(bool value) {
    hasTulaStore.value = value;
  }

  /// رفع جواز السفر
  void uploadPassport() {
    passportUploaded.value = true;

    Get.snackbar(
      'تم التحميل',
      'تم رفع جواز السفر بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: AppColors.whiteColor,
    );
  }

  /// رفع بطاقة الهوية
  void uploadIdCard() {
    idCardUploaded.value = true;

    Get.snackbar(
      'تم التحميل',
      'تم رفع بطاقة الهوية بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: AppColors.whiteColor,
    );
  }

  /// تغيير نوع المستخدم (شخص طبيعي / تجاري)
  void changeUserType(UserType type) {
    if (selectedUserType.value != type) {
      selectedUserType.value = type;
    }
  }

  /// -------------------------------
  ///  إرسال البيانات النهائية
  /// -------------------------------
  void signUp() {
    if (selectedUserType.value == UserType.natural) {
      print("--- تسجيل شخص طبيعي ---");
      print("الاسم الكامل: ${fullNameController.text}");
      print("الهاتف: ${phoneController.text}");
      print("الإيميل: ${emailNaturalController.text}");
    } else {
      print("--- تسجيل شخص تجاري ---");
    }

    Get.snackbar(
      "نجاح",
      "تم إرسال بيانات التسجيل بنجاح.",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  /// -------------------------------
  /// تنظيف الذاكرة عند الإغلاق
  /// -------------------------------
  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    usernameController.dispose();
    emailNaturalController.dispose();
    super.onClose();
  }
}

/// نوع المستخدم
enum UserType { natural, commercial }
