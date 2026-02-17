import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/drawer_feature/bindings/select_visa_country_binding.dart';
import 'package:flight_app/features/drawer_feature/bindings/settings_binding.dart';
import 'package:flight_app/features/drawer_feature/views/f&q_view.dart';
import 'package:flight_app/features/drawer_feature/views/lost_luggage_view.dart';
import 'package:flight_app/features/drawer_feature/views/select_visa_country_view.dart';
import 'package:flight_app/features/drawer_feature/views/setting_view.dart';
import 'package:flight_app/features/main_feature/widgets/custom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondColor,
      width: screenWidth(1),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight(20),
              left: screenWidth(80),
              right: screenWidth(80),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  "أكثر",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth(24.6),
                  ),
                ),
                SizedBox(width: screenWidth(10)),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                CustomNavigationItem(
                  imageUrl: 'assets/images/drawer_pages/Passport2.svg',
                  title: 'تطبيق التأشيرة',
                  onTap: () {
                    Get.back();
                    Get.to(
                      SelectVisaCountryView(),
                      binding: SelectVisaCountryBinding(),
                    );
                  },
                  isPofile: false,
                ),
                CustomNavigationItem(
                  isPofile: false,
                  imageUrl:
                      'assets/images/drawer_pages/Case Round Minimalistic.svg',
                  title: 'الأمتعة المفقودة',
                  onTap: () {
                    Get.back();
                    Get.to(LostLuggageView());
                  },
                ),
                CustomNavigationItem(
                  isPofile: false,

                  imageUrl: 'assets/images/drawer_pages/Calendar.svg',
                  title: 'رحلات مجدولة',
                  onTap: () {
                    Get.back();
                  },
                ),
                CustomNavigationItem(
                  isPofile: false,
                  imageUrl: 'assets/images/drawer_pages/Info2 Circle.svg',
                  title: 'حول',
                  onTap: () {
                    Get.back();
                  },
                ),
                CustomNavigationItem(
                  isPofile: false,
                  imageUrl: 'assets/images/drawer_pages/Settings.svg',
                  title: 'الإعدادات',
                  onTap: () {
                    Get.back();
                    Get.to(SettingsView(), binding: SettingsBinding());
                  },
                ),
                CustomNavigationItem(
                  isPofile: false,
                  imageUrl: 'assets/images/drawer_pages/Dialog 2.svg',
                  title: 'أسئلة شائعة',
                  onTap: () {
                    Get.back();
                    Get.to(FAQView());
                  },
                ),
                CustomNavigationItem(
                  isPofile: false,

                  imageUrl: 'assets/images/drawer_pages/Shield Check.svg',
                  title: 'سياسة الخصوصية',
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
