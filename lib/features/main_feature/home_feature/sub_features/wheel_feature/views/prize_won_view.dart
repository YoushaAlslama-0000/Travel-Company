import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/common/enum.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/prize_won_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CelebrationView extends GetView<CelebrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, size: screenWidth(10)),
            onPressed: () => Get.back(),
          ),
        ],
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('جائزة حاز عليها!'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                String imageUrl =
                    "assets/images/win_wheel/Frame 1464203876.png";
                if (controller.prizeType.value == PrizeType.DISCOUNT) {
                  imageUrl = "assets/images/win_wheel/Frame 1464204011 (2).png";
                } else if (controller.prizeType.value == PrizeType.GIFT) {
                  imageUrl = "assets/images/win_wheel/Frame 1464204011 (1).png";
                }
                return SizedBox(
                  width: screenWidth(3),
                  child: Image.asset(imageUrl),
                );
              }),
              SizedBox(height: screenWidth(40)),
              const Text(
                'مبروك!',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                'لقد فزت بالجائزة!',
                style: TextStyle(fontSize: 18.0, color: AppColors.greyColor),
              ),
              const SizedBox(height: 30.0),
              Obx(
                () => Container(
                  width: screenWidth(1.2),
                  height: screenWidth(4),
                  padding: EdgeInsets.symmetric(vertical: screenWidth(40)),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          controller.currentReward.value?.name ?? '',
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: screenWidth(30)),
                      Text(
                        'صالح حتى 31 مارس',

                        style: const TextStyle(
                          fontSize: 16.0,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40.0),
              const Text(
                'شارك فوزك مع الأصدقاء!',
                style: TextStyle(fontSize: 16.0, color: AppColors.blackColor),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: screenWidth(15),
                        height: screenWidth(15),
                        margin: EdgeInsetsDirectional.only(
                          bottom: screenWidth(40),
                        ),
                        child: Image.asset(
                          "assets/images/social_icon/whatsapp.png",
                        ),
                      ),
                      Text("واتساب"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenWidth(15),
                        height: screenWidth(15),
                        margin: EdgeInsetsDirectional.only(
                          bottom: screenWidth(40),
                        ),
                        child: Image.asset(
                          "assets/images/social_icon/Facebook.png",
                        ),
                      ),
                      Text("فيسبوك"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenWidth(15),
                        height: screenWidth(15),
                        margin: EdgeInsetsDirectional.only(
                          bottom: screenWidth(40),
                        ),
                        child: Image.asset(
                          "assets/images/social_icon/instagram 1.png",
                        ),
                      ),
                      Text("انستجرام"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: screenWidth(15),
                        height: screenWidth(15),
                        margin: EdgeInsetsDirectional.only(
                          bottom: screenWidth(40),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () {},
                        ),
                      ),
                      Text("أكثر"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenWidth(3)),
              CustomButton(
                buttonHieght: screenWidth(8),
                buttonText: 'ادرج مكافأتك',
                buttonColor: AppColors.mainColor,
                onTap: () {
                  controller.addReward();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
