import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final int? maxLength;
  final bool requireExactLength;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.prefix,
    this.suffixIcon,
    this.onSuffixTap,
    this.maxLength,
    this.requireExactLength = false,
    this.autovalidateMode,
    this.validator,
  });

  String? _defaultValidator(String? value) {
    if (validator != null) return validator!(value);

    if (maxLength == null) return null;

    final val = value ?? '';

    if (requireExactLength) {
      if (val.length != maxLength) {
        return 'يجب أن يحتوي الحقل على $maxLength أحرف/أرقام.';
      }
      return null;
    }

    if (val.length < maxLength!) {
      return 'يجب إدخال $maxLength أحرف/أرقام على الأقل.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final List<TextInputFormatter> inputFormatters = [];

    if (maxLength != null) {
      inputFormatters.add(LengthLimitingTextInputFormatter(maxLength));
    }

    if (keyboardType == TextInputType.phone) {
      inputFormatters.add(FilteringTextInputFormatter.digitsOnly);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight(60)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth(25),
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: screenHeight(80)),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            obscuringCharacter: '*',

            keyboardType: keyboardType,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            autovalidateMode: autovalidateMode,
            validator: _defaultValidator,
            decoration: InputDecoration(
              counterText: '',
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.textGreyColor),
              prefixIcon: prefix,
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(suffixIcon, color: AppColors.greyColor),
                      onPressed: onSuffixTap,
                    )
                  : null,
              fillColor: AppColors.greyColor.withOpacity(0.1),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.mainColor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.mainColor, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.redAccent.withOpacity(0.7),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.redAccent.withOpacity(0.8),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth(20),
                vertical: screenWidth(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
