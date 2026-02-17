import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Enum to manage which form is visible
enum UserType { natural, commercial }

class SignUpController extends GetxController {
  // --- STATE VARIABLES ---

  // Manages the selected user type ('Natural' or 'Commercial')
  var selectedUserType = UserType.natural.obs;

  // Manages password field visibility
  var isPasswordObscured = true.obs;
  var isConfirmPasswordObscured = true.obs;

  // Manages password validation criteria
  var hasMinLength = false.obs;
  var hasLetter = false.obs;
  var hasDigitOrSpecial = false.obs;

  // A controller for the "Do you have a Tula store?" selection
  var hasTulaStore = Rxn<bool>();

  // --- TEXT EDITING CONTROLLERS ---

  // Natural Person Form Controllers
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailNaturalController = TextEditingController();
  final referralLinkController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Commercial Person Form Controllers
  final usernameController = TextEditingController();
  final emailCommercialController = TextEditingController();
  final expectedCustomersController = TextEditingController();
  final minimumLimitController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Add a listener to the password field to validate in real-time
    passwordController.addListener(() {
      validatePassword(passwordController.text);
    });
  }

  @override
  void onClose() {
    // Dispose all controllers to prevent memory leaks
    fullNameController.dispose();
    phoneController.dispose();
    emailNaturalController.dispose();
    referralLinkController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    emailCommercialController.dispose();
    expectedCustomersController.dispose();
    minimumLimitController.dispose();
    addressController.dispose();
    super.onClose();
  }

  // --- METHODS ---

  void changeUserType(UserType type) {
    if (selectedUserType.value != type) {
      selectedUserType.value = type;
    }
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscured.value = !isConfirmPasswordObscured.value;
  }

  void selectTulaStore(bool value) {
    hasTulaStore.value = value;
  }

  void validatePassword(String password) {
    hasMinLength.value = password.length >= 8;
    hasLetter.value = password.contains(RegExp(r'[a-zA-Z]'));
    hasDigitOrSpecial.value = password.contains(
      RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'),
    );
  }

  void signUp() {
    // This is where you would handle the final submission logic
    if (selectedUserType.value == UserType.natural) {
      print("--- Signing up as Natural Person ---");
      print("Full Name: ${fullNameController.text}");
      print("Phone: ${phoneController.text}");
      print("Email: ${emailNaturalController.text}");
      print("Referral: ${referralLinkController.text}");
      print("Password: ${passwordController.text}");
    } else {
      print("--- Signing up as Commercial Person ---");
      print("Username: ${usernameController.text}");
      print("Email: ${emailCommercialController.text}");
      print("Has Tula Store: ${hasTulaStore.value}");
      print("Expected Customers: ${expectedCustomersController.text}");
      print("Address: ${addressController.text}");
      // Add logic for image uploads here
    }

    // You can show a snackbar on success
    Get.snackbar(
      "نجاح",
      "تم إرسال بيانات التسجيل بنجاح.",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
