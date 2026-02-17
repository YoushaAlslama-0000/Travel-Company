import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCountryCard extends StatelessWidget {
  final String countryName;
  final String countryFlagUrl;
  final Color color;
  const CustomCountryCard({
    super.key,
    required this.countryName,
    required this.countryFlagUrl,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.17),
      height: screenHeight(16.2),
      padding: EdgeInsets.all(6),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),

        border: Border.all(color: AppColors.borderGreyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                countryFlagUrl,
                width: screenWidth(20),
                height: screenHeight(20),
                placeholderBuilder: (BuildContext context) =>
                    CircularProgressIndicator(),
              ),
              SizedBox(width: screenWidth(24)),
              Text(
                countryName,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: screenWidth(24.6)),
              ),
            ],
          ),
          SizedBox(width: screenWidth(24)),
          SizedBox(
            width: screenWidth(16.4),
            height: screenHeight(24),
            child: SvgPicture.asset(
              'assets/images/drawer_pages/Check Circle.svg',
              // ignore: deprecated_member_use
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
