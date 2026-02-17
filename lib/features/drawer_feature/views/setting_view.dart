import 'package:flight_app/features/drawer_feature/controllers/setting_controller.dart';
import 'package:flight_app/features/drawer_feature/widgets/custom_setting_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الإعدادات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(
              () => CustomSettingCard(
                imageUrl: 'assets/images/drawer_pages/Passport2.svg',
                hasButton: true,
                title: 'التنبيهات',
                value: controller.notificationsEnabled.value,
                ontap: () {
                  controller.notificationsEnabled.value =
                      !controller.notificationsEnabled.value;
                  controller.toggleNotifications(
                    controller.notificationsEnabled.value,
                  );
                },
              ),
            ),
            CustomSettingCard(
              imageUrl: 'assets/images/drawer_pages/Shield Check.svg',
              hasButton: false,
              title: "اللغة",
              ontap: () {
                Get.back();
              },
            ),
            CustomSettingCard(
              imageUrl: 'assets/images/drawer_pages/iPhone.svg',
              hasButton: false,
              title: 'عملة',
              ontap: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
