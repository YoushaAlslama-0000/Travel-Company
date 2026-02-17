import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/splash_feature/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  final SplashController splashController = Get.put(SplashController());

  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screenWidth(1),
        height: screenHeight(1),
        child: Image.asset(
          "assets/images/splash/splash.png",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
