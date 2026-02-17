import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_inkwell.dart';
import 'package:flight_app/features/auth_feature/controllers/resend_controller.dart';
import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
import 'package:flight_app/features/auth_feature/widgets/password_validation.dart';
import 'package:flight_app/features/main_feature/home_feature/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResendView extends GetView<ResendController> {
  const ResendView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResendController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight(10)),
              child: Image.asset("assets/images/login/login4.png"),
            ),
            SizedBox(height: screenHeight(30)),
            Text(
              ' إعادة تعيين كلمة المرور ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth(15),
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            Text(
              'ضع كلمة مرور جديدة لاستعادة الوصول.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth(22),
                fontWeight: FontWeight.bold,
                color: AppColors.greyColor,
              ),
            ),

            SizedBox(height: screenWidth(10)),

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
            Obx(
              () => CustomTextField(
                controller: controller.confirmPasswordController,
                label: 'تأكيد كلمة المرور',
                hint: 'yousha0000',
                obscureText: controller.isconfirmPasswordObscured.value,
                suffixIcon: controller.isconfirmPasswordObscured.value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                onSuffixTap: controller.toggleConfirmPasswordVisibility,
              ),
            ),
            PasswordValidation(),
            CustomInkwell(
              ontap: () {
                Get.off(HomeView());
              },
              text: 'إرسال',
            ),
          ],
        ),
      ),
    );
  }
}
