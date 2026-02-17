import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Enum to manage which form is visible

class ResendController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isPasswordObscured = true.obs;
  var isconfirmPasswordObscured = true.obs;

  var hasMinLength = false.obs;
  var hasLetter = false.obs;
  var hasDigitOrSpecial = false.obs;

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();

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

  void toggleConfirmPasswordVisibility() {
    isconfirmPasswordObscured.value = !isconfirmPasswordObscured.value;
  }

  @override
  void onInit() {
    super.onInit();
    // Add a listener to the password field to validate in real-time
    passwordController.addListener(() {
      validatePassword(passwordController.text);
    });
    confirmPasswordController.addListener(() {
      validatePassword(confirmPasswordController.text);
    });
  }

  void validatePassword(String password) {
    hasMinLength.value = password.length >= 8;
    hasLetter.value = password.contains(RegExp(r'[a-zA-Z]'));
    hasDigitOrSpecial.value = password.contains(
      RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'),
    );
  }

  void Resend() {
    if (selectedUserType.value == UserType.natural) {
      print("Password: ${passwordController.text}");
      print("confirmPassword: ${confirmPasswordController.text}");
    }
  }
}
