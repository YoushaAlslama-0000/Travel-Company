// import 'package:flight_app/common/custom_utiles/colors.dart';
// import 'package:flight_app/common/custom_utiles/functions_utils.dart';
// import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserTypeToggle extends GetView<SignUpController> {
//   const UserTypeToggle({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Container(
//         decoration: BoxDecoration(
//           color: AppColors.borderGreyColor,
//           borderRadius: BorderRadius.circular(15),
//         ),

//         child: Row(
//           children: [
//             _buildToggleButton(
//               'اقتصادي',
//               UserType.natural,
//               controller.selectedUserType.value == UserType.natural,
//             ),
//             _buildToggleButton(
//               'تجاري',
//               UserType.commercial,
//               controller.selectedUserType.value == UserType.commercial,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildToggleButton(String text, UserType type, bool isSelected) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => controller.changeUserType(type),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 800),
//           padding: EdgeInsets.symmetric(vertical: screenHeight(60)),
//           decoration: BoxDecoration(
//             color: isSelected ? AppColors.mainColor : Colors.transparent,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Text(
//             text,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
//               fontWeight: FontWeight.bold,
//               fontSize: screenWidth(25),
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

class UserTypeToggle extends GetView<SignUpController> {
  const UserTypeToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<SignUpController>();

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: AppColors.borderGreyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            _buildToggleButton(
              ctrl,
              'اقتصادي',
              UserType.natural,
              ctrl.selectedUserType.value == UserType.natural,
            ),
            _buildToggleButton(
              ctrl,
              'تجاري',
              UserType.commercial,
              ctrl.selectedUserType.value == UserType.commercial,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(
    SignUpController controller,
    String text,
    UserType type,
    bool isSelected,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeUserType(type),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          padding: EdgeInsets.symmetric(vertical: screenHeight(60)),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainColor : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(25),
            ),
          ),
        ),
      ),
    );
  }
}
