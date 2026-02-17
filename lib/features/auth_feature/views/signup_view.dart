import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flight_app/features/auth_feature/views/login_view.dart';
import 'package:flight_app/features/auth_feature/widgets/commercial_person_form.dart';
import 'package:flight_app/features/auth_feature/widgets/natural_person_form.dart';
import 'package:flight_app/features/auth_feature/widgets/user_type_toggle.dart';
import 'package:flight_app/features/main_feature/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight(10)),
                child: Image.asset("assets/images/signup/illustration.png"),
              ),
              SizedBox(height: screenHeight(30)),
              Text(
                'إنشاء حساب',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth(12),
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: screenWidth(18)),
              Text(
                'اشترك في بضع خطوات سهلة وابدأ الحجز فوراً.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth(25),
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: screenHeight(30)),

              UserTypeToggle(),
              SizedBox(height: screenWidth(15)),

              Obx(() {
                // Here we switch between our two form widgets
                return controller.selectedUserType.value == UserType.natural
                    ? NaturalPersonForm()
                    : CommercialPersonForm();
              }),
              SizedBox(height: screenHeight(40)),

              // 5. Sign Up Button
              CustomButton(
                buttonText: 'اشتراك',
                buttonColor: AppColors.mainColor,
                onTap: () {
                  Get.off(
                    MainView(),
                    transition: Transition.fade,
                    duration: Duration(milliseconds: 500),
                  );
                },
              ),

              SizedBox(height: screenHeight(20)),

              // 6. Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'لديك حساب بالفعل ؟ ',
                    style: TextStyle(color: AppColors.greyColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(LoginInView());
                    },
                    child: Text(
                      'تسجيل الدخول',
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
      ),
    );
  }
}
