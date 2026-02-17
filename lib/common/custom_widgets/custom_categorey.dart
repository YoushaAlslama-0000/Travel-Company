import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';

class CustomCategorey extends StatelessWidget {
  final String imageUrl;
  final String title;
  const CustomCategorey({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth(7),
          height: screenWidth(7),
          decoration: BoxDecoration(
            color: AppColors.mainColorWithOpacity,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: Image.asset(imageUrl)),
        ),
        Text(title),
      ],
    );
  }
}
