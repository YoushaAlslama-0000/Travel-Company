// import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
// import 'package:flight_app/features/auth_feature/widgets/image_uploader.dart';
// import 'package:flight_app/features/main_feature/home_feature/sub_features/haj_feature/controllers/haj_form_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flight_app/common/custom_utiles/colors.dart';
// import 'package:flight_app/common/custom_utiles/functions_utils.dart';

// class HajjFormView extends GetView<HajjAppController> {
//   HajjFormView({super.key});

//   final idNumber = TextEditingController();

//   final RxString selectedTrip = "الحج".obs;

//   final List<Map<String, dynamic>> countries = const [
//     {'name': 'Saudi Arabia', 'code': '+966', 'flag': '🇸🇦', 'length': 9},
//     {'name': 'United States', 'code': '+1', 'flag': '🇺🇸', 'length': 10},
//     {'name': 'Egypt', 'code': '+20', 'flag': '🇪🇬', 'length': 10},
//     {'name': 'United Kingdom', 'code': '+44', 'flag': '🇬🇧', 'length': 10},
//     {'name': 'India', 'code': '+91', 'flag': '🇮🇳', 'length': 10},
//   ];

//   RxString selectedCountryCode = '+966'.obs;
//   RxString selectedCountryFlag = '🇸🇦'.obs;
//   RxInt phoneMaxLength = 9.obs;

//   // ------------ COUNTRY CODE ------------
//   Widget _buildCountryCode(BuildContext context) {
//     return GestureDetector(
//       onTap: () async {
//         final selected = await showDialog<Map<String, dynamic>>(
//           context: context,
//           builder: (_) {
//             return SimpleDialog(
//               title: const Text('اختر الدولة'),
//               children: countries
//                   .map(
//                     (country) => SimpleDialogOption(
//                       onPressed: () => Navigator.pop(context, country),
//                       child: Row(
//                         children: [
//                           Text(
//                             country['flag'],
//                             style: const TextStyle(fontSize: 20),
//                           ),
//                           const SizedBox(width: 8),
//                           Text('${country['name']} (${country['code']})'),
//                         ],
//                       ),
//                     ),
//                   )
//                   .toList(),
//             );
//           },
//         );

//         if (selected != null) {
//           selectedCountryCode.value = selected['code'];
//           selectedCountryFlag.value = selected['flag'];
//           phoneMaxLength.value = selected['length'];
//         }
//       },
//       child: Obx(
//         () => Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(width: screenWidth(20)),
//             Text(
//               '${selectedCountryCode.value}',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const Icon(Icons.arrow_drop_down, color: Colors.grey),
//             const SizedBox(width: 4),
//             Container(width: 1, height: 24, color: Colors.grey[300]),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           children: [
//             _buildHeader(),

//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth(20),
//                   vertical: screenWidth(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // --------------------- USERNAME ---------------------
//                     CustomTextField(
//                       controller: controller.usernameController,
//                       label: 'اسم المستخدم',
//                       hint: 'يوشع السلامه',
//                     ),

//                     // --------------------- ID NUMBER ---------------------
//                     CustomTextField(
//                       controller: idNumber,
//                       label: 'رقم بطاقة الهوية',
//                       hint: '1046402930',
//                       keyboardType: TextInputType.number,
//                     ),

//                     // --------------------- EMAIL ---------------------
//                     CustomTextField(
//                       controller: controller.emailNaturalController,
//                       label: 'البريد الإلكتروني',
//                       hint: 'yousha@gmail.com',
//                       keyboardType: TextInputType.emailAddress,
//                     ),

//                     // --------------------- PHONE ---------------------
//                     Obx(
//                       () => CustomTextField(
//                         controller: controller.phoneController,
//                         label: 'الهاتف',
//                         hint: '012 345 6789',
//                         keyboardType: TextInputType.phone,
//                         prefix: _buildCountryCode(context),
//                         maxLength: phoneMaxLength.value,
//                       ),
//                     ),

//                     // --------------------- TRIP TYPE ---------------------
//                     _title("نوع الرحلة"),

//                     Obx(
//                       () => Row(
//                         children: [
//                           _buildChoiceChip(
//                             'الحج',
//                             controller.selectedTripType.value == 0,
//                             () => controller.selectTrip(0),
//                           ),
//                           SizedBox(width: screenWidth(60)),

//                           _buildChoiceChip(
//                             'عمرة',
//                             controller.selectedTripType.value == 1,
//                             () => controller.selectTrip(1),
//                           ),
//                           SizedBox(width: screenWidth(60)),

//                           _buildChoiceChip(
//                             'جولات',
//                             controller.selectedTripType.value == 2,
//                             () => controller.selectTrip(2),
//                           ),
//                         ],
//                       ),
//                     ),

//                     SizedBox(height: screenHeight(40)),

//                     // --------------------- UPLOADS ---------------------
//                     ImageUploader(
//                       label: "صورة شخصية",
//                       buttonText: "اختر صورة شخصية",
//                       isPdf: false,
//                     ),
//                     ImageUploader(
//                       label: "نسخة جواز السفر",
//                       buttonText: "اختر نسخة PDF من الجواز",
//                       isPdf: true,
//                     ),

//                     SizedBox(height: screenHeight(30)),

//                     _payButton(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ------------------------- HEADER ------------------------------

//   Widget _buildHeader() {
//     return Container(
//       height: screenHeight(5.5),
//       width: screenWidth(1),
//       decoration: BoxDecoration(
//         color: AppColors.mainColor,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20),
//           bottomRight: Radius.circular(20),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.only(top: screenWidth(15)),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
//                   onPressed: () {
//                     Get.back();
//                   },
//                 ),
//                 Text(
//                   'دليل الحج والعمرة',
//                   style: TextStyle(
//                     color: AppColors.whiteColor,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(width: screenWidth(8)),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildStepCircle(3, 'دفع'),
//                 _buildStepConnector(),
//                 _buildStepCircle(2, 'تطبيق', isActive: true),
//                 _buildStepConnector(),
//                 _buildStepCircle(1, 'دليل', isActive: true),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStepCircle(int step, String label, {bool isActive = false}) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(color: AppColors.whiteColor, width: 1.5),
//             color: isActive ? Colors.white : Colors.transparent,
//           ),
//           child: Center(
//             child: Text(
//               '$step',
//               style: TextStyle(
//                 color: isActive ? Color(0xFFE3B02B) : AppColors.whiteColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 5),
//         Text(
//           label,
//           style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
//         ),
//       ],
//     );
//   }

//   Widget _buildStepConnector() {
//     return SizedBox(
//       width: 30,
//       child: Divider(color: AppColors.whiteColor, thickness: 1.5, height: 40),
//     );
//   }

//   // ------------------------- TITLE ------------------------------

//   Widget _title(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15, bottom: 8),
//       child: Text(
//         text,
//         style: TextStyle(
//           color: AppColors.mainColor,
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   // ------------------------- TRIP SELECTOR ------------------------------

//   Widget _tripSelector() {
//     return Obx(
//       () => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _tripButton("الحج", 0),
//           _tripButton("عمرة", 1),
//           _tripButton("جولات", 2),
//         ],
//       ),
//     );
//   }

//   Widget _tripButton(String text, int index) {
//     return Obx(() {
//       bool active = controller.selectedTripType.value == index;

//       return GestureDetector(
//         onTap: () => controller.setTripType(index),
//         child: Container(
//           width: screenWidth(3.5),
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           decoration: BoxDecoration(
//             color: active ? AppColors.mainColor : Colors.grey.withOpacity(0.15),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           alignment: Alignment.center,
//           child: Text(
//             text,
//             style: TextStyle(
//               color: active ? Colors.white : AppColors.textGreyColor,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       );
//     });
//   }

//   // ------------------------- PAY BUTTON ------------------------------

//   Widget _payButton() {
//     return GestureDetector(
//       onTap: () {},
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         decoration: BoxDecoration(
//           color: AppColors.mainColor,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: const Center(
//           child: Text(
//             "تأكيد الدفع",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildChoiceChip(String label, bool isActive, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
//         decoration: BoxDecoration(
//           color: isActive ? AppColors.mainColor : Colors.grey.withOpacity(0.15),
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: isActive ? AppColors.mainColor : Colors.grey,
//             width: 1.2,
//           ),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: isActive ? Colors.white : AppColors.textGreyColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
import 'package:flight_app/features/auth_feature/widgets/image_uploader.dart';
import 'package:flight_app/features/drawer_feature/views/visa_payment_view.dart';
import 'package:flight_app/features/main_feature/booking_feature/views/payment_view.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/haj_feature/controllers/haj_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';

class HajjFormView extends GetView<HajjAppController> {
  HajjFormView({super.key});

  final idNumber = TextEditingController();

  // ********* COUNTRY DATA *********
  final List<Map<String, dynamic>> countries = const [
    {'name': 'Saudi Arabia', 'code': '+966', 'flag': '🇸🇦', 'length': 9},
    {'name': 'United States', 'code': '+1', 'flag': '🇺🇸', 'length': 10},
    {'name': 'Egypt', 'code': '+20', 'flag': '🇪🇬', 'length': 10},
    {'name': 'United Kingdom', 'code': '+44', 'flag': '🇬🇧', 'length': 10},
    {'name': 'India', 'code': '+91', 'flag': '🇮🇳', 'length': 10},
  ];

  final RxString selectedCountryCode = '+966'.obs;
  final RxString selectedCountryFlag = '🇸🇦'.obs;
  final RxInt phoneMaxLength = 9.obs;

  // **********************************************
  // ************ COUNTRY PICKER ******************
  // **********************************************
  Widget _buildCountryCode(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final selected = await showDialog<Map<String, dynamic>>(
          context: context,
          builder: (_) {
            return SimpleDialog(
              title: const Text('اختر الدولة'),
              children: countries
                  .map(
                    (c) => SimpleDialogOption(
                      onPressed: () => Navigator.pop(context, c),
                      child: Row(
                        children: [
                          Text(c['flag'], style: const TextStyle(fontSize: 20)),
                          const SizedBox(width: 8),
                          Text("${c['name']} (${c['code']})"),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        );

        if (selected != null) {
          selectedCountryCode.value = selected['code'];
          selectedCountryFlag.value = selected['flag'];
          phoneMaxLength.value = selected['length'];
        }
      },
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedCountryFlag.value,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 6),
            Text(
              selectedCountryCode.value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.grey),
            Container(
              width: 1,
              height: 24,
              color: Colors.grey[300],
              margin: const EdgeInsets.only(right: 8),
            ),
          ],
        ),
      ),
    );
  }

  // **********************************************
  // ***************** MAIN UI *********************
  // **********************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            _buildHeader(),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(22),
                  vertical: screenWidth(25),
                ),
                child: Column(
                  children: [
                    _buildInputFields(context),
                    SizedBox(height: screenHeight(25)),
                    _payButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **********************************************
  // **************** HEADER ***********************
  // **********************************************
  Widget _buildHeader() {
    return Container(
      height: screenHeight(5.5),
      width: screenWidth(1),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenWidth(15)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  'دليل الحج والعمرة',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: screenWidth(8)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepCircle(3, 'دفع'),
                _buildStepConnector(),
                _buildStepCircle(2, 'تطبيق', isActive: true),
                _buildStepConnector(),
                _buildStepCircle(1, 'دليل', isActive: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(int step, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.whiteColor, width: 1.5),
            color: isActive ? Colors.white : Colors.transparent,
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                color: isActive ? Color(0xFFE3B02B) : AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildStepConnector() {
    return SizedBox(
      width: 35,
      child: Divider(color: Colors.white, thickness: 1.6),
    );
  }

  // **********************************************
  // ******** INPUT FIELDS + UPLOADS **************
  // **********************************************
  Widget _buildInputFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: controller.usernameController,
          label: 'اسم المستخدم',
          hint: 'يوشع السلامه',
        ),

        CustomTextField(
          controller: idNumber,
          label: 'رقم بطاقة الهوية',
          hint: '1046402930',
          keyboardType: TextInputType.number,
        ),

        CustomTextField(
          controller: controller.emailNaturalController,
          label: 'البريد الإلكتروني',
          hint: 'yousha@gmail.com',
          keyboardType: TextInputType.emailAddress,
        ),

        Obx(() {
          return CustomTextField(
            controller: controller.phoneController,
            label: 'رقم الهاتف',
            hint: '012 345 6789',
            keyboardType: TextInputType.phone,
            prefix: _buildCountryCode(context),
            maxLength: phoneMaxLength.value,
          );
        }),

        SizedBox(height: 15),
        _sectionTitle("نوع الرحلة"),

        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _tripButton("الحج", 0),
              _tripButton("عمرة", 1),
              _tripButton("جولات", 2),
            ],
          ),
        ),

        const SizedBox(height: 20),
        ImageUploader(
          label: "صورة شخصية",
          buttonText: "اختر صورة شخصية",
          isPdf: false,
        ),

        ImageUploader(
          label: "نسخة جواز السفر",
          buttonText: "اختر نسخة PDF من الجواز",
          isPdf: true,
        ),
      ],
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.mainColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  // **********************************************
  // *************** TRIP CHIPS *******************
  // **********************************************
  Widget _tripButton(String text, int index) {
    bool active = controller.selectedTripType.value == index;

    return GestureDetector(
      onTap: () => controller.setTripType(index),
      child: Container(
        width: screenWidth(3.5),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: active ? AppColors.mainColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: active ? AppColors.mainColor : Colors.grey.shade400,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : AppColors.textGreyColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // **********************************************
  // **************** PAY BUTTON ******************
  // **********************************************
  Widget _payButton() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const PaymentView());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Center(
          child: Text(
            "تأكيد الدفع",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
