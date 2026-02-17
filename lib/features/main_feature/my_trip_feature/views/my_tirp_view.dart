import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/main_feature/my_trip_feature/controllers/my_tirp_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTripView extends StatelessWidget {
  MyTripView({super.key});

  // final MyTirpController controller = Get.put(MyTirpController());
  final MyTirpController controller = Get.find<MyTirpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('رحلتي', style: TextStyle(fontSize: screenWidth(18))),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Container(
                width: screenWidth(1.1),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTabTitle('القادمة', 0),
                    _buildTabTitle('مكتمل', 1),
                    _buildTabTitle('ملغاة', 2),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        physics: NeverScrollableScrollPhysics(),

        children: [
          _buildTabContent('اول وحدة'),
          _buildTabContent('تاني وحدة'),
          _buildTabContent('تالت وحدة'),
        ],
      ),
    );
  }

  Widget _buildTabTitle(String title, int index) {
    final isSelected = controller.currentIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeTabIndex(index),
      child: Container(
        width: screenWidth(3.5),
        height: screenWidth(12),

        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainColor : AppColors.greyColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String content) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo/Logo.png", width: screenWidth(4)),
          SizedBox(width: screenWidth(20), height: screenWidth(20)),
          Text(
            "لا شيء لعرضه",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: screenWidth(20),
            ),
          ),
        ],
      ),
    );
  }
}
