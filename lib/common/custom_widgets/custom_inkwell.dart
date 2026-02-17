import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';

class CustomInkwell extends StatefulWidget {
  final Function? ontap;
  final String? text;
  const CustomInkwell({super.key, this.ontap, this.text});

  @override
  State<CustomInkwell> createState() => _CustomInkwellState();
}

class _CustomInkwellState extends State<CustomInkwell> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.ontap != null) widget.ontap!();
      },
      child: Container(
        height: screenHeight(16),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.textGreyColor,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text ?? '',
            style: TextStyle(
              fontSize: screenWidth(18),
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
