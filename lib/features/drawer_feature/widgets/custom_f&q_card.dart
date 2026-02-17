import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';

class CustomFAQItem extends StatelessWidget {
  final String title;
  final String content;

  const CustomFAQItem({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

          border: Border.all(color: AppColors.greyColorWithOpacity),
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),

          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800),
          ),
          textColor: AppColors.whiteColor,
          iconColor: AppColors.greyColor,

          collapsedIconColor: AppColors.blackColor,
          childrenPadding: const EdgeInsets.all(16.0),
          backgroundColor: AppColors.mainColor,
          children: [
            Text(
              content,
              style: TextStyle(
                fontSize: screenWidth(26),
                color: AppColors.secondwhiteColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
