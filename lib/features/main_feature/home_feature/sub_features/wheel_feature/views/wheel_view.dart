import 'dart:async';
import 'dart:math';

import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/wheel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class WheelView extends GetView<WheelController> {
  WheelView({super.key});

  final StreamController<int> selected = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.info_outlined, size: screenWidth(16)),
              onPressed: () => Get.back(),
            ),
          ),
        ],
        title: Text('دور العجلة واربح'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ضَرب العَجلة ',
                    style: TextStyle(
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'حاول حظك واحصل على جوئز مذهلة!',
                    style: TextStyle(fontSize: screenWidth(26)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 290,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FortuneWheel(
                    selected: controller.wheelController.stream,
                    onAnimationEnd: () {},

                    items: [
                      for (var it in controller.prizes)
                        FortuneItem(
                          child: Text(
                            it,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                          ),
                          style: FortuneItemStyle(
                            color: AppColors.mainColor,
                            borderColor: Colors.black,
                            borderWidth: 3,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth(10)),
            Center(
              child: CustomButton(
                buttonWidth: screenWidth(2),
                buttonText: "جرب حظك",
                buttonColor: AppColors.mainColor,
                onTap: () {
                  // controller.startSpinning();
                  controller.spinWheelWithAnimation();
                },
              ),
            ),

            SizedBox(height: screenWidth(60)),
            Center(
              child: Obx(() {
                return Text(
                  '${controller.remainingSpins.value} دورات متبقية',
                  style: TextStyle(fontSize: screenWidth(26)),
                );
              }),
            ),
            const SizedBox(height: 10),

            Text(
              'الانتصارات السابقة',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),

            SizedBox(
              child: Obx(
                () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.previousPrizeDetails.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: screenWidth(30),
                        horizontal: screenWidth(30),
                      ),
                      child: Container(
                        width: screenWidth(1.17),
                        height: screenHeight(16),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(50),
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),

                          border: Border.all(color: AppColors.borderGreyColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/win_wheel/Frame 1464203876.png",
                              width: screenWidth(10),
                            ),
                            SizedBox(width: screenWidth(40)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.previousPrizeDetails[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth(24),
                                  ),
                                ),
                                Text(
                                  controller
                                          .previousPrizeDetails[index]
                                          .expiryDate ??
                                      '',
                                ),
                              ],
                            ),
                            Spacer(),
                            if (controller
                                .previousPrizeDetails[index]
                                .isClaimed)
                              const Text('تمت المطالبة')
                            else
                              CustomButton(
                                buttonText: 'استخدم الان',
                                buttonColor: AppColors.mainColor,
                                onTap: () {},
                                buttonWidth: screenWidth(5),
                                buttonHieght: screenWidth(14),
                                fontSize: screenWidth(28),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
