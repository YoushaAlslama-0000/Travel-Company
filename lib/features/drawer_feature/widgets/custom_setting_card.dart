import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomSettingCard extends StatelessWidget {
  final String imageUrl;
  final bool hasButton;
  final String title;
  final Function ontap;
  final bool? value;
  const CustomSettingCard({
    super.key,
    required this.imageUrl,
    required this.hasButton,
    required this.title,
    required this.ontap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
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
              SvgPicture.asset(
                imageUrl,
                width: 30,
                height: 30,
                color: AppColors.mainColor,
              ),
              SizedBox(width: screenWidth(24.6)),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
              hasButton == true
                  ? Switch(
                      value: value!,
                      onChanged: (value) {
                        ontap();
                      },
                      activeColor: AppColors.whiteColor,
                      activeTrackColor: AppColors.mainColor,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Function>('ontap', ontap));
  }
}
