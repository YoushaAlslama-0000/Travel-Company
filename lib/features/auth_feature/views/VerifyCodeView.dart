import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_inkwell.dart';
import 'package:flight_app/features/auth_feature/controllers/verify_code_controller.dart';
import 'package:flight_app/features/auth_feature/views/resend_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key});

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
  final VerifyCodeController controller = Get.put(VerifyCodeController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: screenWidth(8),
      height: screenWidth(8),
      textStyle: TextStyle(
        fontSize: screenWidth(22),
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.mainColor, width: 1),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight(15)),
              child: Image.asset("assets/images/login/login3.png"),
            ),

            SizedBox(height: screenWidth(10)),

            Text(
              'أدخل رمزًا مكونًا من 8 أرقام',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth(15),
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),

            Text(
              'من فضلك أدخل رمز OTP الذي تلقيته على هذا البريد الإلكتروني: (yousha@gmail.com)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth(22),
                fontWeight: FontWeight.bold,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: screenWidth(30)),

            Center(
              child: Pinput(
                controller: controller.pinController,
                length: 8,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                ),
                onCompleted: (value) => debugPrint(value),
              ),
            ),

            SizedBox(height: screenWidth(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'هل لم تتلقَ الرمز؟  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth(22),
                    fontWeight: FontWeight.bold,
                    color: AppColors.greyColor,
                  ),
                ),

                InkWell(
                  onTap: () {
                    controller.resendCode();
                  },
                  child: Text(
                    'إعادة إرسال الرمز',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth(22),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth(10)),

            CustomInkwell(
              ontap: () {
                Get.off(ResendView());
              },
              text: 'إرسال',
            ),
          ],
        ),
      ),
    );
  }
}
