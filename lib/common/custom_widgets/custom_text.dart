import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color textColor;
  final String text;
  final double? textSize;
  final int? maxLines;
  final FontWeight? textWeight;
  const CustomText(
      {super.key,
      required this.textColor,
      required this.text,
      this.textSize,
      this.textWeight,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: textColor,
          fontSize: textSize == null ? 16 : textSize,
          fontWeight: textWeight == null ? FontWeight.normal : textWeight),
      maxLines: maxLines,
    );
  }
}
