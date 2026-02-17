import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  RxInt currentPage = 0.obs;
  PageController pageController = PageController();

  updatePage(int index) {
    currentPage.value = index;
  }
}
