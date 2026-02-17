// import 'package:flight_app/common/custom_utiles/functions_utils.dart';
// import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'custom_text_field.dart';
// import 'password_validation.dart';

// class NaturalPersonForm extends GetView<SignUpController> {
//   const NaturalPersonForm({super.key});

//   Widget _buildCountryCode() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(width: screenWidth(20)),
//           const Text('+966', style: TextStyle(fontWeight: FontWeight.bold)),
//           const Icon(Icons.arrow_drop_down, color: Colors.grey),
//           const SizedBox(width: 4),
//           Container(width: 1, height: 24, color: Colors.grey[300]),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CustomTextField(
//           controller: controller.fullNameController,
//           label: 'الاسم الكامل (كما في جواز السفر)',
//           hint: 'يوشع محمد السلامه',
//         ),
//         CustomTextField(
//           controller: controller.phoneController,
//           label: 'الهاتف',
//           hint: '012 888 9080',
//           keyboardType: TextInputType.phone,
//           prefix: _buildCountryCode(),
//         ),
//         CustomTextField(
//           controller: controller.emailNaturalController,
//           label: 'البريد الإلكتروني',
//           hint: 'yousha.alslama.8086@gmail.com',
//           keyboardType: TextInputType.emailAddress,
//         ),
//         CustomTextField(
//           controller: controller.referralLinkController,
//           label: 'رابط الإحالة',
//           hint: 'https://yousha_alslama.com',
//           suffixIcon: Icons.copy_all_outlined,
//           onSuffixTap: () {},
//         ),
//         Obx(
//           () => CustomTextField(
//             controller: controller.passwordController,
//             label: 'كلمة المرور',
//             hint: '********',
//             obscureText: controller.isPasswordObscured.value,
//             suffixIcon: controller.isPasswordObscured.value
//                 ? Icons.visibility_off_outlined
//                 : Icons.visibility_outlined,
//             onSuffixTap: controller.togglePasswordVisibility,
//           ),
//         ),
//         const PasswordValidation(),
//         Obx(
//           () => CustomTextField(
//             controller: controller.confirmPasswordController,
//             label: 'تأكيد كلمة المرور',
//             hint: '********',
//             obscureText: controller.isConfirmPasswordObscured.value,
//             suffixIcon: controller.isConfirmPasswordObscured.value
//                 ? Icons.visibility_off_outlined
//                 : Icons.visibility_outlined,
//             onSuffixTap: controller.toggleConfirmPasswordVisibility,
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text_field.dart';
import 'password_validation.dart';

// ignore: must_be_immutable
class NaturalPersonForm extends GetView<SignUpController> {
  NaturalPersonForm({super.key});

  final List<Map<String, dynamic>> countries = const [
    {'name': 'Saudi Arabia', 'code': '+966', 'flag': '🇸🇦', 'length': 9},
    {'name': 'United States', 'code': '+1', 'flag': '🇺🇸', 'length': 10},
    {'name': 'Egypt', 'code': '+20', 'flag': '🇪🇬', 'length': 10},
    {'name': 'United Kingdom', 'code': '+44', 'flag': '🇬🇧', 'length': 10},
    {'name': 'India', 'code': '+91', 'flag': '🇮🇳', 'length': 10},
  ];

  RxString selectedCountryCode = '+966'.obs;
  RxString selectedCountryFlag = '🇸🇦'.obs;
  RxInt phoneMaxLength = 9.obs;

  Widget _buildCountryCode(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selected = await showDialog<Map<String, dynamic>>(
          context: context,
          builder: (_) {
            return SimpleDialog(
              title: const Text('اختر الدولة'),
              children: countries
                  .map(
                    (country) => SimpleDialogOption(
                      onPressed: () => Navigator.pop(context, country),
                      child: Row(
                        children: [
                          Text(
                            country['flag'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 8),
                          Text('${country['name']} (${country['code']})'),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        );

        if (selected != null) {
          selectedCountryCode.value = selected['code'];
          selectedCountryFlag.value = selected['flag'];
          phoneMaxLength.value = selected['length'];
        }
      },
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: screenWidth(20)),
            Text(
              '${selectedCountryCode.value}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
            const SizedBox(width: 4),
            Container(width: 1, height: 24, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller.fullNameController,
          label: 'الاسم الكامل (كما في جواز السفر)',
          hint: 'يوشع محمد السلامه',
        ),
        Obx(
          () => CustomTextField(
            controller: controller.phoneController,
            label: 'الهاتف',
            hint: '012 345 6789',
            keyboardType: TextInputType.phone,
            prefix: _buildCountryCode(context),
            maxLength: phoneMaxLength.value, // تحديد عدد الأرقام حسب الدولة
          ),
        ),
        CustomTextField(
          controller: controller.emailNaturalController,
          label: 'البريد الإلكتروني',
          hint: 'yousha@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
        CustomTextField(
          controller: controller.referralLinkController,
          label: 'رابط الإحالة',
          hint: 'https://yousha_alslama.com',
          suffixIcon: Icons.copy_all_outlined,
          onSuffixTap: () {
            /* Add copy logic */
          },
        ),
        Obx(
          () => CustomTextField(
            controller: controller.passwordController,
            label: 'كلمة المرور',
            hint: 'yousha0000',
            obscureText: controller.isPasswordObscured.value,
            suffixIcon: controller.isPasswordObscured.value
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            onSuffixTap: controller.togglePasswordVisibility,
          ),
        ),
        PasswordValidation(),
        Obx(
          () => CustomTextField(
            controller: controller.confirmPasswordController,
            label: 'تأكيد كلمة المرور',
            hint: '*********',

            obscureText: controller.isConfirmPasswordObscured.value,
            suffixIcon: controller.isConfirmPasswordObscured.value
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            onSuffixTap: controller.toggleConfirmPasswordVisibility,
          ),
        ),
      ],
    );
  }
}
