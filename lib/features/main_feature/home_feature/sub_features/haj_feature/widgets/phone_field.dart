import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    this.label,
    this.border,
  });
  final String? label;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "الهاتف",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        // Directionality(
        //   textDirection: TextDirection.ltr,
        //   child:
        //    IntlPhoneField(
        //     decoration: InputDecoration(
        //       labelText: label,
        //       border: border,
        //     ),
        //     initialCountryCode: 'SA',
        //     onChanged: (phone) {
        //       print(phone.completeNumber);
        //     },
        //   ),
        // ),
      ],
    );
  }
}
