import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/drawer_feature/bindings/visa_process_binding.dart';
import 'package:flight_app/features/drawer_feature/controllers/select_visa_country_controller.dart';
import 'package:flight_app/features/drawer_feature/views/visa_process_view.dart';
import 'package:flight_app/features/drawer_feature/widgets/custom_country_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectVisaCountryView extends GetView<SelectVisaCountryController> {
  const SelectVisaCountryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(
        () => CustomButton(
          buttonText: 'مواصلة',
          buttonColor: controller.selectedCountry.value.isNotEmpty
              ? AppColors.mainColor
              : AppColors.greyColorWithOpacity,
          onTap: controller.selectedCountry.value.isNotEmpty
              ? () {
                  Get.snackbar(
                    "تم التأكيد",
                    'تم اختيار البلد: ${controller.selectedCountry.value}',
                    backgroundColor: AppColors.greenColor,
                    colorText: AppColors.whiteColor,
                  );
                  Get.to(VisaProcessView(), binding: VisaProcessBinding());
                }
              : () {
                  Get.snackbar(
                    "خطأ",
                    "الرجاء اختيار بلدالفيزا",
                    backgroundColor: AppColors.redColor,
                    colorText: AppColors.whiteColor,
                  );
                },
        ),
      ),
      appBar: AppBar(
        title: Text(
          'اختر بلد الفيزا',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: screenWidth(1),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.countries.length,
              itemBuilder: (context, index) {
                final country = controller.countries[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(20),
                    vertical: screenWidth(40),
                  ),
                  child: InkWell(
                    onTap: () => controller.selectCountry(country['name']!),
                    child: Obx(
                      () => CustomCountryCard(
                        countryName: country['name']!,
                        countryFlagUrl: country['flagSvgUrl']!,
                        color: controller.isCountrySelected(country['name']!)
                            ? AppColors.mainColor
                            : AppColors.greyColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
