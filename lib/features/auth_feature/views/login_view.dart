import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/auth_feature/controllers/login_controller.dart';
import 'package:flight_app/features/auth_feature/views/forgot_password_view.dart';
import 'package:flight_app/features/auth_feature/views/signup_view.dart';
import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
import 'package:flight_app/features/auth_feature/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginInView extends GetView<LogInController> {
  const LoginInView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight(10)),
              child: Image.asset(
                "assets/images/login/login1.png",
                width: screenWidth(1),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: screenHeight(30)),
            Text(
              'تسجيل دخول',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth(12),
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: screenWidth(18)),
            Text(
              'استطلع حسابك وأدِر الحجوزات بكل سهولة.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth(25),
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: screenHeight(30)),
            CustomTextField(
              controller: controller.emailCommercialController,
              label: 'البريد الإلكتروني',
              hint: 'yousha@gmail.com',
              keyboardType: TextInputType.emailAddress,
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

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PasswordValidation(),
                GestureDetector(
                  onTap: () {
                    Get.to(ForgotPasswordView());
                  },
                  child: Text(
                    'هل نسيت كلمة المرور ؟',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            InkWell(
              onTap: () {},
              child: Container(
                height: screenHeight(16),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textGreyColor,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: screenWidth(18),
                      fontWeight: FontWeight.bold,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight(40)),
            InkWell(
              onTap: () {},
              child: Container(
                height: screenHeight(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.borderGreyColor),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'تسجيل دخول بـ Google',
                      style: TextStyle(fontSize: screenWidth(18)),
                    ),
                    SizedBox(width: screenWidth(40)),
                    Icon(
                      Icons.g_mobiledata_rounded,
                      color: Colors.redAccent,
                      size: screenWidth(8),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: screenHeight(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ليس لديك حساب ؟ ',
                  style: TextStyle(color: AppColors.greyColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.off(SignUpView());
                  },
                  child: Text(
                    'سجل الآن',
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth(10)),
          ],
        ),
      ),
    );
  }
}
