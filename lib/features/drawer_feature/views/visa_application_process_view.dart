import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
import 'package:flight_app/features/auth_feature/widgets/image_uploader.dart';
import 'package:flight_app/features/drawer_feature/controllers/visa_application_process_controller.dart';
import 'package:flight_app/features/drawer_feature/views/visa_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class VisaApplicationView extends GetView<VisaApplicationController> {
  const VisaApplicationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تقديم طلب فيزا',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: controller.fullNameController,
              label: 'الاسم',
              hint: 'يوشع السلامه',
            ),
            CustomTextField(
              controller: controller.passportNumberController,
              label: 'رقم جواز السفر',
              hint: '104104104',
            ),
            Text(
              'تاريخ الميلاد',
              style: TextStyle(
                fontSize: screenWidth(25),
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),
            ),
            GestureDetector(
              onTap: () => controller.pickDateOfBirth(context),
              child: AbsorbPointer(
                child: Obx(
                  () => TextFormField(
                    decoration: InputDecoration(
                      counterText: '',
                      hintStyle: TextStyle(color: AppColors.textGreyColor),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth(20),
                        vertical: screenWidth(25),
                      ),
                      fillColor: AppColors.greyColor.withOpacity(0.1),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: AppColors.mainColor,
                          width: 0.5,
                        ),
                      ),

                      hintText: controller.selectedDateOfBirth.value != null
                          ? DateFormat(
                              'yyyy-MM-dd',
                            ).format(controller.selectedDateOfBirth.value!)
                          : '1/1/2000',
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                    ),
                    controller: TextEditingController(
                      text: controller.selectedDateOfBirth.value != null
                          ? DateFormat(
                              'yyyy-MM-dd',
                            ).format(controller.selectedDateOfBirth.value!)
                          : '',
                    ),
                    style: GoogleFonts.cairo(
                      color: Colors.black87,
                      fontSize: 16,
                    ), // تخصيص الخط
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight(60)),

            _buildCountryDropdown(),
            SizedBox(height: 25),

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

            CustomButton(
              buttonText: 'مواصلة',
              buttonColor: AppColors.mainColor,
              onTap: () {
                controller.continueApplication;
                Get.to(VisaPaymentView());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryDropdown() {
    final List<String> countries = [
      'اختر بلدك',
      'المملكة العربية السعودية',
      'مصر',
      'الإمارات العربية المتحدة',
      'الأردن',
      'لبنان',
      'الكويت',
      'البحرين',
      'قطر',
      'عمان',
      'العراق',
      'فلسطين',
      'سوريا',
      'اليمن',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'بلد الإقامة',
          style: TextStyle(
            fontSize: screenWidth(25),
            fontWeight: FontWeight.bold,
            color: AppColors.mainColor,
          ),
        ),
        Obx(
          () => DropdownButtonFormField<String>(
            value: controller.selectedCountry.value.isEmpty
                ? 'اختر بلدك'
                : controller.selectedCountry.value,
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            isExpanded: true,
            items: countries.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: GoogleFonts.cairo(
                    color: AppColors.blackColor,
                    fontSize: screenWidth(23),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null && newValue != 'اختر بلدك') {
                controller.selectCountry(newValue);
              } else if (newValue == 'اختر بلدك') {
                controller.selectCountry('');
              }
            },
            validator: (value) {
              if (value == null || value == 'اختر بلدك' || value.isEmpty) {
                return 'الرجاء اختيار بلد الإقامة';
              }
              return null;
            },

            decoration: InputDecoration(
              counterText: '',
              hintText: 'اختر بلدك',
              hintStyle: TextStyle(color: AppColors.textGreyColor),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth(20),
                vertical: screenWidth(25),
              ),
              fillColor: AppColors.greyColor.withOpacity(0.1),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.mainColor, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.mainColor, width: 1.2),
              ),
            ),
            dropdownColor: Colors.white,
            style: GoogleFonts.cairo(
              color: Colors.black87,
              fontSize: screenWidth(23),
            ),
          ),
        ),
      ],
    );
  }
}
