import 'package:flutter/material.dart';
// import 'package:flight_app/ui/shared/colors.dart';
// import 'package:flight_app/ui/shared/utils.dart';

class CustomTitleBar extends StatelessWidget {
  const CustomTitleBar({
    super.key,
    required this.title1,
    this.title2,
    required this.titleColor1,
    this.titleColor2,
    this.textDecoration,
    this.fontSize1 = 20,
    this.fontSize2 = 20,
    this.fontWeight,
    this.decorationThickness,
  });
  final String title1;
  final String? title2;
  final Color titleColor1;
  final Color? titleColor2;
  final TextDecoration? textDecoration;
  final double? fontSize1;
  final double? fontSize2;
  final double? decorationThickness;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title2 ?? "",
            style: TextStyle(
              color: titleColor1,
              fontSize: fontSize1,
              fontWeight: fontWeight,
            ),
          ),
          Text(
            title1,
            style: TextStyle(
              color: titleColor2,
              fontSize: fontSize2,
              fontWeight: fontWeight,
              decoration: textDecoration,
              decorationColor: titleColor2,
              decorationThickness: decorationThickness,
            ),
          ),
        ],
      ),
    );
  }
}
