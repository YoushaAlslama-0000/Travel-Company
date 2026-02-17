// lib/features/main_feature/home_feature/widgets/points_card_widget.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flight_app/common/custom_utiles/app_dimensions.dart';
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/home_feature/controllers/home_controller.dart';

class PointsCardWidget extends GetView<HomeController> {
  const PointsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.pointsCardMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.smallBorderRadius),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.smallPadding),
        child: Row(
          children: [
            Container(
              width: AppDimensions.profilePictureSize,
              height: AppDimensions.profilePictureSize,
              decoration: BoxDecoration(
                color: AppColors.whiteColorWithopacity,
                borderRadius: BorderRadius.circular(
                  AppDimensions.circularRadius,
                ),
                border: Border.all(color: AppColors.whiteColor),
                image: const DecorationImage(
                  image: AssetImage('assets/images/home/person.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: AppDimensions.smallHorizontalSpacing),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // جعل المحاذاة أفقيا لليسار
              children: [
                const Text("مجموع النقاط"),
                Obx(
                  () => Row(
                    children: [
                      Text(
                        "${controller.totalPoints.value}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: AppDimensions.smallHorizontalSpacing / 2,
                      ), // كان screenWidth(80)
                      Container(
                        width: AppDimensions.pointsIconSize,
                        height: AppDimensions.pointsIconSize,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.circularRadius,
                          ),
                          border: Border.all(color: AppColors.whiteColor),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.star,
                            color: AppColors.whiteColor,
                            size: AppDimensions.pointsIconSmallSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              fontSize: AppDimensions.redeemButtonHeight / 2, // تقدير لحجم الخط
              buttonText: "استرد الان",
              buttonColor: AppColors.mainColor,
              onTap: controller.redeemPoints, // استدعاء دالة من الـ Controller
              buttonWidth: AppDimensions.redeemButtonWidth,
              buttonHieght: AppDimensions.redeemButtonHeight,
            ),
          ],
        ),
      ),
    );
  }
}
