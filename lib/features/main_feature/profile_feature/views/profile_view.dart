// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/profile_feature/controllers/profile_controller.dart';
import 'package:flight_app/features/main_feature/profile_feature/widgets/build_balance_sectoin.dart';
import 'package:flight_app/features/main_feature/profile_feature/widgets/build_image_picker.dart';
import 'package:flight_app/features/main_feature/profile_feature/widgets/build_image_picker_sheet.dart';
import 'package:flight_app/features/main_feature/widgets/custom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
  final ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('حساب', style: TextStyle(fontSize: screenWidth(18))),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: Column(
        children: [
          BuildImagePickerSection(),
          BuildBalanceSectoin(),
          CustomNavigationItem(
            imageUrl: "assets/images/drawer_pages/Vector.svg",
            isPofile: true,
            onTap: () {},
            title: "تعديل معلوماتي",
            iconColor: AppColors.mainColor,
          ),
          CustomNavigationItem(
            imageUrl: "assets/images/drawer_pages/Vector.svg",
            isPofile: true,
            onTap: () {},
            title: "تغيير كلمة المرور",
            iconColor: AppColors.mainColor,
          ),
          CustomNavigationItem(
            imageUrl: "assets/images/drawer_pages/Vector.svg",
            isPofile: true,
            onTap: () {},
            title: "احل واكسب",
            iconColor: AppColors.mainColor,
          ),
          CustomNavigationItem(
            imageUrl: "assets/images/drawer_pages/Vector.svg",
            isPofile: true,
            onTap: () {},
            title: "تسجيل الخروج ",
            isLogOut: true,
            iconColor: AppColors.redColor,
          ),
        ],
      ),
    );
  }
}
