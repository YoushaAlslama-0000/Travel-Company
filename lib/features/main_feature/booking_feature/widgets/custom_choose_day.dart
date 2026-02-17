import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flight_app/common/custom_utiles/colors.dart';

class CustomFirstCard extends StatelessWidget {
  final String day;
  final String date;
  final String price;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomFirstCard({
    super.key,
    required this.day,
    required this.date,
    required this.price,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparentColor,
      hoverColor: AppColors.transparentColor,
      focusColor: AppColors.transparentColor,

      onTap: onPressed,
      child: Container(
        width: screenWidth(2.9),
        height: screenHeight(7.9),

        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.greyColorWithOpacity),
          color: AppColors.borderGreyColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenWidth(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(date, style: TextStyle(color: AppColors.blackColor)),
              ],
            ),
            Text("من", style: TextStyle(color: AppColors.secondBlackColor)),
            Spacer(),
            Container(
              width: screenWidth(1),
              height: screenHeight(34.4),
              decoration: BoxDecoration(
                color: AppColors.mainColor,

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  price,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: screenWidth(26),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
