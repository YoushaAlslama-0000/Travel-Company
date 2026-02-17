import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text_field.dart';
import 'image_uploader.dart';
import 'tula_store_question.dart';

class CommercialPersonForm extends GetView<SignUpController> {
  const CommercialPersonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller.usernameController,
          label: 'اسم المستخدم',
          hint: 'يوشع السلامه',
        ),
        CustomTextField(
          controller: controller.emailCommercialController,
          label: 'البريد الإلكتروني',
          hint: 'yousha@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),
        TulaStoreQuestion(),
        CustomTextField(
          controller: controller.expectedCustomersController,
          label: 'العملاء المتوقعون شهرياً',
          hint: '10',
        ),
        CustomTextField(
          controller: controller.minimumLimitController,
          label: 'الحد الأدنى',
          hint: '5',
          keyboardType: TextInputType.number,
        ),
        CustomTextField(
          controller: controller.addressController,
          label: 'عنوان المكتب / المحل (اختياري)',
          hint: 'محل رقم 10 مجمع النخيل الرياض',
        ),

        ImageUploader(
          label: "صورة شخصية",
          buttonText: "اختر صورة شخصية",
          isPdf: true,
        ),
        ImageUploader(
          label: "نسخة جواز السفر",
          buttonText: "اختر نسخة PDF من الجواز",
          isPdf: true,
        ),
      ],
    );
  }
}
