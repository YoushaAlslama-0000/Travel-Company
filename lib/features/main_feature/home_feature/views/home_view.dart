import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/common/custom_widgets/custom_categorey.dart';
import 'package:flight_app/common/custom_widgets/custom_title_bar.dart';
import 'package:flight_app/features/main_feature/home_feature/controllers/home_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/haj_feature/views/hajj_guid_view.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/hotels_feature/views/hotels_view.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/bindings/wheel_binding.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/views/wheel_view.dart';
import 'package:flight_app/features/main_feature/home_feature/widgets/custom_corsal_slider.dart';
import 'package:flight_app/features/main_feature/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: screenWidth(1),
                  height: screenHeight(3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home/plane.jpg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: screenWidth(6)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(HajjGuideScreen());
                        },
                        child: CustomCategorey(
                          imageUrl: "assets/images/home/cat1.png",
                          title: 'الحج',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(HotelsScreen());
                        },
                        child: CustomCategorey(
                          imageUrl: "assets/images/home/cat2.png",
                          title: 'الفنادق',
                        ),
                      ),
                      CustomCategorey(
                        imageUrl: "assets/images/home/cat3.png",
                        title: 'السفن',
                      ),
                      CustomCategorey(
                        imageUrl: "assets/images/home/cat4.png",
                        title: 'رحلة جوية',
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            WheelView(),
                            binding: WheelBinding(),
                            transition: Transition.fade,
                            duration: Duration(milliseconds: 500),
                          );
                        },
                        child: CustomCategorey(
                          imageUrl: "assets/images/home/cat5.png",
                          title: 'جائزة',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteColor,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth(6),
                          height: screenWidth(6),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColorWithopacity,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.whiteColor),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/home/person.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth(20)),
                        Column(
                          children: [
                            Text("مجموع النقاط"),
                            Row(
                              children: [
                                Text(
                                  "575776",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: screenWidth(80)),
                                Container(
                                  width: screenWidth(20),
                                  height: screenWidth(20),

                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.star,
                                      color: AppColors.whiteColor,
                                      size: screenWidth(30),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        CustomButton(
                          fontSize: screenWidth(28),
                          buttonText: "استرد الان",
                          buttonColor: AppColors.mainColor,
                          onTap: () {},

                          buttonWidth: screenWidth(5),
                          buttonHieght: screenWidth(12),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomTitleBar(
                  title1: 'شاهد الكل',
                  title2: 'اكتشف الوجهات',
                  fontSize2: screenWidth(26),
                  textDecoration: TextDecoration.underline,
                  titleColor1: AppColors.blackColor,
                  titleColor2: AppColors.mainColor,
                ),
                SizedBox(
                  width: screenWidth(1),
                  height: screenWidth(1.8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: screenWidth(2.6),
                            height: screenWidth(1.8),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: screenWidth(40)),
                                Center(
                                  child: Container(
                                    width: screenWidth(3),
                                    height: screenWidth(3.5),
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          // "assets/images/home/cou$index.png",
                                          "assets/images/home/cou2.png",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("اسطنبول"),
                                ),
                                Center(
                                  child: CustomButton(
                                    buttonBorderColor: AppColors.mainColor,
                                    buttonWidth: screenWidth(4),
                                    buttonHieght: screenWidth(10),

                                    buttonText: "من 500 ريال",
                                    fontSize: screenWidth(30),
                                    buttonColor: AppColors.whiteColor,
                                    onTap: () {},
                                    textColor: AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CustomTitleBar(
                  title1: 'شاهد الكل',
                  title2: 'الرحلات القادمة',
                  fontSize2: screenWidth(26),
                  textDecoration: TextDecoration.underline,
                  titleColor1: AppColors.blackColor,
                  titleColor2: AppColors.mainColor,
                ),
                SizedBox(
                  width: screenWidth(1),
                  height: screenHeight(2),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: screenWidth(2.6),
                            height: screenWidth(2.5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.greyColor,
                              ),
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenWidth(1),
                                  height: screenWidth(10),

                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColorWithopacity,
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: AppColors.greyColor,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("رقم الرحلة"),
                                        Text(
                                          "BMO490",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "جدة",
                                            style: TextStyle(
                                              fontSize: screenWidth(20),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("11:40"),
                                          ),
                                          Text("الثلاثاء 04 مارس"),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("5 ساعات و 20 دقيقة"),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/home/plane-ticket.png",
                                            ),
                                          ),
                                          Text("بدون توقف"),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "لاهور",
                                            style: TextStyle(
                                              fontSize: screenWidth(20),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("11:30"),
                                          ),
                                          Text("الثلاثاء 04 مارس"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: screenWidth(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              final mainController = Get.find<MainController>();
                              mainController.openDrawer();
                            },
                            child: Container(
                              width: screenWidth(8),
                              height: screenWidth(8),

                              decoration: BoxDecoration(
                                color: AppColors.whiteColorWithopacity,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: AppColors.whiteColor),
                              ),
                              child: Icon(
                                Icons.menu,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth(20)),
                          Container(
                            width: screenWidth(8),
                            height: screenWidth(8),

                            decoration: BoxDecoration(
                              color: AppColors.whiteColorWithopacity,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: AppColors.whiteColor),
                            ),
                            child: Icon(
                              Icons.search,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: screenWidth(8),
                            height: screenWidth(8),
                            child: Image.asset(
                              "assets/images/logo/Logo (2white).png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CorsalSlider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
