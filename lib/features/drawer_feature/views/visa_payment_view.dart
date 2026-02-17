import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/drawer_feature/views/visa_status_view.dart'
    hide screenWidth, screenHeight;
import 'package:flight_app/features/main_feature/booking_feature/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VisaPaymentView extends GetView<PaymentController> {
  const VisaPaymentView({super.key});

  void _showSuccessDialog(BuildContext context) {
    Get.dialog(
      Center(
        child: Container(
          width: screenWidth(1.2),
          padding: EdgeInsets.all(screenWidth(25)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/booking/Icon (4).png',
                  width: screenWidth(5),
                  height: screenWidth(5),
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight(60)),

                Text(
                  'تم الدفع بنجاح!',
                  style: TextStyle(
                    fontSize: screenWidth(18),
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: screenHeight(100)),

                Text(
                  'لقد تم معالجة دفعة طلب التأشيرة بنجاح.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth(24),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: screenHeight(60)),

                CustomButton(
                  buttonText: 'تتبع حالة التأشيرة',
                  buttonColor: AppColors.mainColor,
                  onTap: () {
                    Get.back();
                    Get.to(() => VisaStatusView());
                  },
                ),
                SizedBox(height: screenHeight(70)),

                CustomButton(
                  buttonText: 'عودة إلى الصفحة الرئيسية',
                  buttonColor: AppColors.borderGreyColor,
                  textColor: AppColors.blackColor,
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.4),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "تعليمات الدفع",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
        child: ListView(
          children: [
            Container(
              width: screenWidth(1.17),
              padding: const EdgeInsets.all(6),
              height: screenHeight(6.72),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.mainColor, width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "المبلغ المستحق للدفع",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth(28.18),
                    ),
                  ),
                  Text(
                    "249 ريال",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth(15.17),
                    ),
                  ),
                  Text(
                    "رسوم معالجة التأشيرة",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenWidth(28.18),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight(80)),
              child: Text(
                "اختر طريقة الدفع",
                style: TextStyle(
                  fontSize: screenWidth(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            _buildPaymentOption(
              context,
              title: 'الدفع باستخدام الرصيد الداخلي',
              value: 'cash',
              imagePath: 'assets/images/booking/Bank.png',
              controller: controller,
            ),
            _buildPaymentOption(
              context,
              title: 'بطاقة الائتمان / الخصم',
              value: 'credit_card',
              imagePath: 'assets/images/booking/Card.png',
              controller: controller,
            ),
            _buildPaymentOption(
              context,
              title: 'تحويل مصرفي',
              value: 'bank',
              imagePath: 'assets/images/booking/Bank.png',
              controller: controller,
            ),
            _buildPaymentOption(
              context,
              title: 'باي بال',
              value: 'paypal',
              imagePath: 'assets/images/booking/PayPal.png',
              controller: controller,
            ),

            SizedBox(height: screenHeight(40)),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.greyColorWithOpacity.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(screenWidth(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/drawer_pages/Info Circle.svg",
                        color: AppColors.blackColor,
                      ),
                      SizedBox(width: screenWidth(40)),
                      const Text(
                        'تعليمات الدفع',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight(60)),
                  Text(
                    '1. اختر طريقة الدفع المفضلة لديك.',
                    style: TextStyle(fontSize: screenWidth(25)),
                  ),
                  Text(
                    '2. أكمل الدفع في غضون 15 دقيقة.',
                    style: TextStyle(fontSize: screenWidth(25)),
                  ),
                  Text(
                    '3. سيتم تأكيد الدفع لاحقًا.',
                    style: TextStyle(fontSize: screenWidth(25)),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenWidth(20)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: screenWidth(25),
                  color: AppColors.blackColor.withOpacity(0.8),
                ),
                SizedBox(width: screenWidth(50)),
                Text(
                  "تشفير SSL بتقنية 256 بت آمنة",
                  style: TextStyle(
                    color: AppColors.blackColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/booking/Payment Icons (1).png',
                  height: screenHeight(30),
                ),
                SizedBox(width: screenWidth(150)),
                Image.asset(
                  'assets/images/booking/Payment Icons (3).png',
                  height: screenHeight(30),
                ),
                SizedBox(width: screenWidth(150)),
                Image.asset(
                  'assets/images/booking/Payment Icons.png',
                  height: screenHeight(30),
                ),
              ],
            ),
            SizedBox(height: screenHeight(30)),

            CustomButton(
              buttonText: 'ادفع الآن',
              buttonColor: AppColors.mainColor,
              onTap: () {
                if (controller.selectedPaymentMethod.value!.isNotEmpty) {
                  _showSuccessDialog(context);
                } else {
                  Get.snackbar('تنبيه', 'الرجاء اختيار طريقة الدفع');
                }
              },
            ),
            SizedBox(height: screenWidth(10)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext context, {
    required String title,
    required String value,
    required String imagePath,
    required PaymentController controller,
  }) {
    return InkWell(
      onTap: () => controller.selectPaymentMethod(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.mainColor, width: 0.5),
          ),
          child: Row(
            children: [
              Obx(
                () => Radio<String>(
                  value: value,
                  activeColor: AppColors.mainColor,
                  groupValue: controller.selectedPaymentMethod.value,
                  onChanged: (v) => controller.selectPaymentMethod(v!),
                ),
              ),
              Image.asset(imagePath, width: 30, height: 30),
              SizedBox(width: 16),
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
