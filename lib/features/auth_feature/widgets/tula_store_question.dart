// import 'package:flight_app/common/custom_utiles/colors.dart';
// import 'package:flight_app/common/custom_utiles/functions_utils.dart';
// import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // You can define the color here or import it from a central theme file
// const Color primaryColor = Color(0xFFD4AF37);

// class TulaStoreQuestion extends GetView<SignUpController> {
//   const TulaStoreQuestion({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: screenHeight(40)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'هل لديك متجر او لا ؟',

//             style: TextStyle(
//               fontSize: screenWidth(25),
//               fontWeight: FontWeight.bold,
//               color: AppColors.greyColor,
//             ),
//           ),
//           SizedBox(height: screenHeight(60)),
//           Obx(
//             () => Row(
//               children: [
//                 _buildChoiceChip(
//                   'نعم',
//                   true,
//                   controller.hasTulaStore.value == true,
//                   () => controller.selectTulaStore(true),
//                 ),
//                 SizedBox(width: screenWidth(60)),
//                 _buildChoiceChip(
//                   'لا',
//                   false,
//                   controller.hasTulaStore.value == false,
//                   () => controller.selectTulaStore(false),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChoiceChip(
//     String label,
//     bool value,
//     bool isSelected,
//     VoidCallback onTap,
//   ) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           padding: EdgeInsets.symmetric(vertical: screenHeight(60)),
//           decoration: BoxDecoration(
//             color: isSelected ? AppColors.mainColor : AppColors.borderGreyColor,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Text(
//             label,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: screenWidth(25),
//               color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const Color primaryColor = Color(0xFFD4AF37);

class TulaStoreQuestion extends GetView<SignUpController> {
  const TulaStoreQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<SignUpController>(); // 👈 تعريف الكنترولر هنا

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'هل لديك متجر او لا ؟',
            style: TextStyle(
              fontSize: screenWidth(25),
              fontWeight: FontWeight.bold,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: screenHeight(60)),
          Obx(
            () => Row(
              children: [
                _buildChoiceChip(
                  'نعم',
                  ctrl.hasTulaStore.value == true,
                  () => ctrl.selectTulaStore(true),
                ),
                SizedBox(width: screenWidth(60)),
                _buildChoiceChip(
                  'لا',
                  ctrl.hasTulaStore.value == false,
                  () => ctrl.selectTulaStore(false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceChip(String label, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: screenHeight(60)),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainColor : AppColors.borderGreyColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(25),
              color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
            ),
          ),
        ),
      ),
    );
  }
}
