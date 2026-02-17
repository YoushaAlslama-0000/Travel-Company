import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/booking_feature/controllers/payment_controller.dart';
import 'package:flight_app/features/main_feature/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.borderGreyColor,
      appBar: AppBar(
        title: const Text(
          'الدفع',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => controller.selectPaymentMethod('credit_card'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondwhiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Obx(
                        () => Radio<String>(
                          value: 'credit_card',
                          groupValue: controller.selectedPaymentMethod.value,
                          onChanged: (value) =>
                              controller.selectPaymentMethod(value!),
                        ),
                      ),
                      Image.asset(
                        'assets/images/booking/Card.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'بطاقة الائتمان / الخصم',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () => controller.selectPaymentMethod('bank_transfer'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondwhiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Obx(
                        () => Radio<String>(
                          value: 'bank_transfer',
                          groupValue: controller.selectedPaymentMethod.value,
                          onChanged: (value) =>
                              controller.selectPaymentMethod(value!),
                        ),
                      ),
                      Image.asset(
                        'assets/images/booking/Bank.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 16),
                      const Text('تحويل مصرفي', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () => controller.selectPaymentMethod('paypal'),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.secondwhiteColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Obx(
                        () => Radio<String>(
                          value: 'paypal',
                          groupValue: controller.selectedPaymentMethod.value,
                          onChanged: (value) =>
                              controller.selectPaymentMethod(value!),
                        ),
                      ),
                      Image.asset(
                        'assets/images/booking/PayPal.png',
                        width: 30,
                        height: 30,
                      ), // استبدل بمسار الصورة
                      const SizedBox(width: 16),
                      const Text('باي بال', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),

            const Text(
              'تعليمات الدفع',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '1. اختر طريقة الدفع المفضلة لديك.',
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              '2. أكمل الدفع في غضون 15 دقيقة.',
              style: TextStyle(fontSize: 14),
            ),
            const Text(
              '3. سيتم تأكيد الدفع لاحقًا.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: screenWidth(25),
                  color: AppColors.secondBlackColor,
                ),
                SizedBox(width: screenWidth(50)),
                Text(
                  "تشفير SSL بتقنية 256 بت آمنة",
                  style: TextStyle(color: AppColors.secondBlackColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/booking/Payment Icons (1).png',
                  height: 20,
                ), // استبدل بمسار صورة فيزا
                const SizedBox(width: 8),
                Image.asset(
                  'assets/images/booking/Payment Icons (3).png',
                  height: 20,
                ), // استبدل بمسار صورة ماستركارد
                const SizedBox(width: 8),
                Image.asset(
                  'assets/images/booking/Payment Icons.png',
                  height: 20,
                ), // استبدل بمسار صورة أمريكان إكسبريس
              ],
            ),
            const Spacer(),
            CustomButton(
              buttonText: 'انطلق الآن 500 ريال',
              buttonColor: AppColors.mainColor,
              onTap: () {
                if (controller.selectedPaymentMethod.value != null) {
                  Get.offAll(MainView());
                } else {
                  Get.snackbar('تنبيه', 'الرجاء اختيار طريقة الدفع');
                }
              },
            ),

            // زر "انتقال الآن"
          ],
        ),
      ),
    );
  }
}
