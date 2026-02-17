import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Enum to manage which form is visible

class ForgotPasswordController extends GetxController {
  final emailCommercialController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordObscured = true.obs;

  var hasMinLength = false.obs;
  var hasLetter = false.obs;
  var hasDigitOrSpecial = false.obs;

  @override
  void onClose() {
    emailCommercialController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  var selectedUserType = UserType.natural.obs;

  void changeUserType(UserType type) {
    if (selectedUserType.value != type) {
      selectedUserType.value = type;
    }
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  @override
  void onInit() {
    super.onInit();
    // Add a listener to the password field to validate in real-time
    passwordController.addListener(() {
      validatePassword(passwordController.text);
    });
  }

  void validatePassword(String password) {
    hasMinLength.value = password.length >= 8;
    hasLetter.value = password.contains(RegExp(r'[a-zA-Z]'));
    hasDigitOrSpecial.value = password.contains(
      RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'),
    );
  }

  void ForgotPassword() {
    // This is where you would handle the final submission logic
    if (selectedUserType.value == UserType.natural) {
      print("Email: ${emailCommercialController.text}");
      print("Password: ${passwordController.text}");
    }
  }
}
