import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';

class CustomSection extends StatefulWidget {
  final String text;
  final Color containerColor;
  const CustomSection(
      {super.key, required this.text, required this.containerColor});

  @override
  State<CustomSection> createState() => _CustomSectionState();
}

class _CustomSectionState extends State<CustomSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          width: screenWidth(5),
          height: screenWidth(100),
          color: widget.containerColor,
          duration: const Duration(milliseconds: 500),
        ),
        Text(widget.text,
            style: TextStyle(
              color: AppColors.greyColor,
            ))
      ],
    );
  }
}
