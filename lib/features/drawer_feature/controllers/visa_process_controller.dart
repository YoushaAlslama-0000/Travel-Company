import 'package:get/get.dart';
import 'package:flutter/material.dart';

class VisaProcessController extends GetxController {
  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  void goToStep(int step) {
    currentStep.value = step;
  }
}
