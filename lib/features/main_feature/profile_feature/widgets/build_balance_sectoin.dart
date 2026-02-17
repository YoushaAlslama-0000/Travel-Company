import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BuildBalanceSectoin extends StatelessWidget {
  const BuildBalanceSectoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: screenWidth(10)),
      child: Container(
        padding: EdgeInsets.all(8),
        width: screenWidth(1.1),
        height: screenHeight(6),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.greyColorWithOpacity),
          color: AppColors.whiteColorWithopacity,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الرصيد :",
                  style: TextStyle(
                    fontSize: screenWidth(20),
                    fontWeight: FontWeight.bold,
                    color: AppColors.borwnColor,
                  ),
                ),
                Text(
                  "= 275 \$ ",
                  style: TextStyle(
                    fontSize: screenWidth(20),
                    fontWeight: FontWeight.bold,
                    color: AppColors.borwnColor,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "12,435.00",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(16),
                    ),
                  ),
                  TextSpan(
                    text: " ريال",
                    style: TextStyle(
                      color: AppColors.blackColor,

                      fontSize: screenWidth(18),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "رقم الحساب",
                      style: TextStyle(
                        fontSize: screenWidth(26),

                        color: AppColors.blackColor,
                      ),
                    ),
                    Text(
                      " 6757**** *** ***",
                      style: TextStyle(
                        fontSize: screenWidth(28),
                        fontWeight: FontWeight.bold,
                        color: AppColors.borwnColor,
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  buttonText: "اضافة رصيد",
                  withButton: true,

                  buttonColor: AppColors.mainColor,
                  onTap: () {},
                  fontSize: screenWidth(26),
                  buttonWidth: screenWidth(3.5),
                  buttonHieght: screenHeight(24),
                  icon: Icons.credit_card_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
