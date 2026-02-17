// ignore_for_file: prefer_const_constructors

import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/common/repsoistries/shared_prefrence_repository.dart';
import 'package:flight_app/features/auth_feature/bindings/signup_binding.dart';
import 'package:flight_app/features/auth_feature/views/signup_view.dart';
import 'package:flight_app/features/intro_feature/controllers/intro_conroller.dart';
import 'package:flight_app/features/main_feature/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroView extends StatelessWidget {
  final IntroController controller = Get.put(IntroController());

  final List<Map<String, String>> _introData = [
    {
      "image": "assets/images/intro/illustration.png",
      "title": "الحجز السهل",

      "text": "حجوزات السفر سريعة وخالية من المتاعب.",
    },
    {
      "image": "assets/images/intro/illustration2.png",

      "title": "عجلة الحظ",
      "text": "دور واربح خصومات وعروض سفر.",
    },
    {
      "image": "assets/images/intro/illustration3.png",

      "title": "جدولة الرحلات",
      "text": "خطط لرحلاتك ببضع نقرات.",
    },
    {
      "image": "assets/images/intro/illustration4.png",
      "title": "جاهز للطيران",
      "text": "استعد لمغامرتك القادمة.",
    },
  ];

  IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight(22),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(50),
                bottomEnd: Radius.circular(50),
              ),
            ),
            child: TextButton(
              onPressed: () {
                SharedPrefrenceRepository().setFirstLunch(false);
                Get.to(
                  SignUpView(),
                  transition: Transition.fade,
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: Text(
                "التخطي",
                style: TextStyle(
                  color: AppColors.whiteColor,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Center(
            child: Column(
              children: [
                Text(
                  'مرحباً بكم ',
                  style: TextStyle(
                    fontSize: screenWidth(16),
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  'في',
                  style: TextStyle(
                    fontSize: screenWidth(16),
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  'تذكرتي',
                  style: TextStyle(
                    fontSize: screenWidth(12),
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth(1),
            height: screenHeight(3),
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: _introData.length,
              onPageChanged: (value) {
                controller.updatePage(value);
              },
              itemBuilder: (context, index) {
                return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: kAlwaysCompleteAnimation,
                      curve: Curves.easeIn,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth(10),
                      vertical: screenWidth(10),
                    ),
                    child: Image.asset(
                      _introData[index]["image"]!,
                      height: screenHeight(1),
                      width: screenWidth(1),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            width: screenWidth(1),
            height: screenWidth(1.5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(milliseconds: 500),
                    child: Obx(
                      () => Padding(
                        padding: EdgeInsetsDirectional.only(
                          bottom: screenWidth(20),
                        ),
                        child: Text(
                          _introData[controller.currentPage.value]["title"]!,
                          style: TextStyle(
                            fontSize: screenWidth(16),
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(milliseconds: 500),
                    child: Obx(
                      () => Padding(
                        padding: EdgeInsetsDirectional.only(
                          bottom: screenWidth(20),
                        ),
                        child: Text(
                          _introData[controller.currentPage.value]["text"]!,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.secondBlackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: _introData.length,

                    effect: ExpandingDotsEffect(
                      dotColor: AppColors.greyColor,
                      activeDotColor: AppColors.mainColor,
                      dotWidth: screenWidth(40),
                      dotHeight: screenWidth(40),
                    ),
                  ),
                  Spacer(),
                  Obx(
                    () => controller.currentPage.value == _introData.length - 1
                        ? SlideTransition(
                            position:
                                Tween<Offset>(
                                  begin: Offset(0, 1),
                                  end: Offset(0, 0),
                                ).animate(
                                  CurvedAnimation(
                                    parent: kAlwaysCompleteAnimation,
                                    curve: Curves.easeInOut,
                                  ),
                                ),
                            child: CustomButton(
                              buttonBorderColor: AppColors.transparentColor,
                              buttonColor: AppColors.mainColor,

                              buttonText: 'البدء',
                              onTap: () {
                                SharedPrefrenceRepository().setFirstLunch(
                                  false,
                                );
                                Get.to(
                                  SignUpView(),
                                  binding: SignUpBinding(),
                                  transition: Transition.fade,
                                  duration: const Duration(milliseconds: 500),
                                );
                              },
                              textColor: AppColors.whiteColor,
                            ),
                          )
                        : CustomButton(
                            buttonBorderColor: AppColors.transparentColor,
                            buttonColor: AppColors.blackColor,

                            buttonText: 'التالي',
                            onTap: () {
                              controller.currentPage.value =
                                  controller.currentPage.value + 1;

                              controller.pageController.animateToPage(
                                controller.currentPage.value,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                            },
                            textColor: AppColors.whiteColor,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
