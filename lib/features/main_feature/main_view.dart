// // ignore_for_file: must_be_immutable, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/main_feature/main_controller.dart';
import 'package:flight_app/features/main_feature/widgets/custom_darwer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // MainController controller = Get.put(MainController());
  MainController controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: MainView.scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: Obx(
        () => SizedBox(
          width: screenWidth(1),
          height: screenWidth(5.2),

          child: Theme(
            data: Theme.of(context).copyWith(splashColor: AppColors.whiteColor),
            child: BottomNavigationBar(
              enableFeedback: true,
              useLegacyColorScheme: true,
              backgroundColor: AppColors.whiteColor,
              currentIndex: controller.cuurentIndex.value,
              selectedItemColor: AppColors.mainColor,
              unselectedItemColor: AppColors.blackColor,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.changePage(index);
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/images/bottom_navigation/Component 27.svg',
                    color: AppColors.mainColor,
                  ),
                  backgroundColor: AppColors.blackColor,
                  icon: SvgPicture.asset(
                    'assets/images/bottom_navigation/Component 27.svg',
                  ),
                  label: 'المنزل',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    'assets/images/bottom_navigation/Component 33.svg',
                    color: AppColors.mainColor,
                  ),
                  icon: SvgPicture.asset(
                    'assets/images/bottom_navigation/Component 33.svg',
                  ),

                  label: 'رحلتي',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    color: AppColors.mainColor,
                    'assets/images/bottom_navigation/Component 24.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/images/bottom_navigation/Component 24.svg',
                  ),
                  label: 'حجز',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    color: AppColors.mainColor,

                    'assets/images/bottom_navigation/Component 26.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/images/bottom_navigation/Component 26.svg',
                  ),
                  label: 'وكيل',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    color: AppColors.mainColor,
                    'assets/images/bottom_navigation/Component 31.svg',
                  ),
                  icon: SvgPicture.asset(
                    'assets/images/bottom_navigation/Component 31.svg',
                  ),
                  label: 'حساب',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              alwaysIncludeSemantics: true,
              opacity: animation,
              child: child,
            );
          },
          child: controller.currentView,
        ),
      ),
    );
  }
}
