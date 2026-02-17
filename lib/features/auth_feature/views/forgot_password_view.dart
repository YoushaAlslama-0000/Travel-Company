import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_inkwell.dart';
import 'package:flight_app/features/auth_feature/controllers/forgot_password_controller.dart';
import 'package:flight_app/features/auth_feature/views/VerifyCodeView.dart';
import 'package:flight_app/features/auth_feature/views/signup_view.dart';
import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight(10)),
              child: Image.asset("assets/images/login/login2.png"),
            ),
            SizedBox(height: screenHeight(30)),
            Text(
              'نسيت كلمة المرور',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth(15),
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: screenWidth(18)),
            Text(
              'اعادة تعيين كلمة السر الخاصة بك بسرعة واستعادة الوصول.',
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
            SizedBox(height: screenWidth(20)),

            CustomInkwell(
              text: 'قم بإعادة تعيين كلمة المرور',
              ontap: () {
                Get.to(VerifyCodeView());
              },
            ),
            SizedBox(height: screenWidth(15)),

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
