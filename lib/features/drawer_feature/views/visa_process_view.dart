import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/drawer_feature/bindings/visa_application_process_binding.dart';
import 'package:flight_app/features/drawer_feature/views/visa_application_process_view.dart';
import 'package:flight_app/features/drawer_feature/controllers/visa_process_controller.dart';

class VisaProcessView extends GetView<VisaProcessController> {
  const VisaProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'عملية تقديم طلب التأشيرة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(screenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ======= صندوق العنوان =======
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(screenWidth(25)),
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(screenWidth(25)),
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/drawer_pages/Passport.svg",
                    height: screenHeight(25),
                  ),
                  SizedBox(height: screenHeight(60)),
                  Text(
                    'إجراءات تقديم طلب التأشيرة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(20),
                    ),
                  ),
                  SizedBox(height: screenHeight(80)),
                  Text(
                    'أكمل طلب تأشيرتك في 4 خطوات بسيطة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth(30),
                      color: AppColors.blackColor.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight(35)),

            Expanded(
              child: ListView(
                children: [
                  _buildStepItem(
                    stepNumber: 1,
                    title: 'تفاصيل شخصية',
                    description:
                        'اكتب معلوماتك الأساسية وبيانات الاتصال الخاصة بك.',
                    isLast: false,
                  ),
                  _buildStepItem(
                    stepNumber: 2,
                    title: 'تحميل المستندات',
                    description: 'ارفع نسخة جواز سفرك وصورة حديثة لك.',
                    isLast: false,
                  ),
                  _buildStepItem(
                    stepNumber: 3,
                    title: 'الدفع',
                    description: 'ادفع رسوم معالجة التأشيرة بأمان.',
                    isLast: false,
                  ),
                  _buildStepItem(
                    stepNumber: 4,
                    title: 'حالة المسار',
                    description: 'راقب تقدم طلب تأشيرتك.',
                    isLast: true,
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(screenWidth(25)),
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(screenWidth(25)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/drawer_pages/Info Circle.svg",
                    width: screenWidth(35),
                  ),
                  SizedBox(width: screenWidth(40)),
                  Expanded(
                    child: Text(
                      'تأكد من إعداد جميع المستندات المطلوبة قبل بدء عملية التقدم بطلبك.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.blackColor.withOpacity(.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight(40)),

            CustomButton(
              buttonText: 'ابدأ طلب التأشيرة',
              buttonColor: AppColors.mainColor,
              onTap: () {
                Get.to(
                  VisaApplicationView(),
                  binding: VisaApplicationBinding(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepItem({
    required int stepNumber,
    required String title,
    required String description,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: screenWidth(20),
              height: screenWidth(20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '$stepNumber',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: screenWidth(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: screenHeight(12),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: AppColors.mainColor.withOpacity(.4),
                      width: 1.3,
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(width: screenWidth(40)),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(25),
                ),
              ),
              SizedBox(height: screenHeight(150)),
              Text(
                description,
                style: TextStyle(
                  fontSize: screenWidth(28),
                  color: AppColors.blackColor.withOpacity(.7),
                ),
              ),
              SizedBox(height: screenHeight(40)),
            ],
          ),
        ),
      ],
    );
  }
}
