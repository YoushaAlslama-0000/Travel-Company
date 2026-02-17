// import 'package:flight_app/common/custom_utiles/colors.dart';
// import 'package:flight_app/common/custom_utiles/functions_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomButton extends StatefulWidget {
//   final String buttonText;
//   final Color buttonColor;
//   final Color? textColor;
//   final double? buttonWidth;
//   final double? buttonHieght;
//   final double? fontSize;
//   final Color? buttonBorderColor;
//   final Function onTap;
//   final bool? withButton;
//   final IconData? icon;
//   const CustomButton({
//     super.key,
//     required this.buttonText,
//     required this.buttonColor,
//     required this.onTap,
//     this.buttonBorderColor,
//     this.textColor,
//     this.buttonWidth,
//     this.buttonHieght,
//     this.fontSize,
//     this.withButton,
//     this.icon,
//   });

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         widget.onTap();
//       },
//       child: Container(
//         width: widget.buttonWidth ?? screenWidth(1.1),
//         height: widget.buttonHieght ?? screenWidth(9),
//         decoration: BoxDecoration(
//           borderRadius: widget.buttonBorderColor != null
//               ? BorderRadius.only(
//                   topLeft: Radius.circular(8),
//                   bottomLeft: Radius.circular(8),
//                   bottomRight: Radius.circular(8),
//                 )
//               : BorderRadius.circular(8),
//           border: Border.all(
//             width: 1,
//             color: widget.buttonBorderColor == null
//                 ? AppColors.transparentColor
//                 : widget.buttonBorderColor!,
//           ),
//           color: widget.buttonColor,
//         ),
//         child: Center(
//           child: widget.withButton == null
//               ? Text(
//                   widget.buttonText,
//                   style: TextStyle(
//                     fontSize: widget.fontSize ?? screenWidth(20),
//                     color: widget.textColor == null
//                         ? AppColors.whiteColor
//                         : widget.textColor!,
//                   ),
//                 )
//               : Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "${widget.buttonText} ",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: widget.fontSize ?? screenWidth(20),
//                         color: widget.textColor == null
//                             ? AppColors.whiteColor
//                             : widget.textColor!,
//                       ),
//                     ),
//                     Icon(widget.icon, color: AppColors.whiteColor),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonWidth;
  final double? buttonHieght;
  final double? fontSize;
  final Color? buttonBorderColor;
  final Function onTap;
  final bool? withButton;
  final IconData? icon;
  const CustomButton({
    super.key,
    required this.buttonText,
    this.buttonColor,
    required this.onTap,
    this.buttonBorderColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHieght,
    this.fontSize,
    this.withButton,
    this.icon,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        width: widget.buttonWidth ?? screenWidth(1.1),
        height: widget.buttonHieght ?? screenHeight(16),
        decoration: BoxDecoration(
          borderRadius: widget.buttonBorderColor != null
              ? BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )
              : BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.textGreyColor,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          border: Border.all(
            width: 1,
            color: widget.buttonBorderColor == null
                ? AppColors.transparentColor
                : widget.buttonBorderColor!,
          ),
          color: widget.buttonColor ?? AppColors.mainColor,
        ),
        child: Center(
          child: widget.withButton == null
              ? Text(
                  widget.buttonText,
                  style: TextStyle(
                    fontSize: widget.fontSize ?? screenWidth(20),
                    color: widget.textColor == null
                        ? AppColors.whiteColor
                        : widget.textColor!,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.buttonText} ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: widget.fontSize ?? screenWidth(20),
                        color: widget.textColor == null
                            ? AppColors.whiteColor
                            : widget.textColor!,
                      ),
                    ),
                    Icon(widget.icon, color: AppColors.whiteColor),
                  ],
                ),
        ),
      ),
    );
  }
}
