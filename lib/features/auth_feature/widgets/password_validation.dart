import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordValidation extends GetView<SignUpController> {
  const PasswordValidation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 20, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _validationRow('ثمانية أحرف', controller.hasMinLength.value),
            _validationRow(
              'رقم أو حرف خاص (مثال: @ # \$)',
              controller.hasDigitOrSpecial.value,
            ),
            _validationRow('1 Letter', controller.hasLetter.value),
          ],
        ),
      ),
    );
  }

  Widget _validationRow(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.check_circle_outline,
            color: isValid ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: isValid ? Colors.green : Colors.grey),
          ),
        ],
      ),
    );
  }
}
