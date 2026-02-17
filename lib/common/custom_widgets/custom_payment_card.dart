import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPaymentCard extends StatelessWidget {
  final Function ontap;
  final String groupValue;
  final String value;
  final String title;
  final  Function(String)? onChanged;
  const CustomPaymentCard({super.key, required this.ontap, required this.groupValue, this.onChanged, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),

              border: Border.all(color: AppColors.greyColorWithOpacity),
            ),
            child: Row(
              children: [
                Obx(
                  () => Radio<String>(
                    value: value,
                    groupValue:groupValue,
                    onChanged:
                        (value) =>onChanged,
                  ),
                ),
                Image.asset(
                  'assets/images/booking/Card.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}