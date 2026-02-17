// ignore_for_file: unnecessary_overrides

import 'package:flight_app/common/repsoistries/shared_prefrence_repository.dart';
import 'package:flight_app/features/intro_feature/views/intro_view.dart';
import 'package:flight_app/features/main_feature/home_feature/bindings/home_binding.dart';
import 'package:flight_app/features/main_feature/main_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void cheakDirection() {
    if (SharedPrefrenceRepository().getFirstLunch() &&
        !SharedPrefrenceRepository().getIsLoged()) {
      Get.to(
        transition: Transition.leftToRightWithFade,
        duration: const Duration(milliseconds: 1500),
        IntroView(),
      );
    } else if (!SharedPrefrenceRepository().getIsLoged()) {
      Get.to(
        IntroView(),
        // const SignUpView(),
        // transition: Transition.fade,
        // duration: const Duration(milliseconds: 800),
      );
    } else {
      Get.off(
        MainView(),
        binding: HomeBinding(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 1000),
      );
    }
  }

  @override
  void onInit() async {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), cheakDirection);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
