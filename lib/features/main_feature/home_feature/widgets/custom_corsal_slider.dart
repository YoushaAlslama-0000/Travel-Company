// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/main_feature/home_feature/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CorsalSlider extends StatefulWidget {
  const CorsalSlider({super.key});

  @override
  State<CorsalSlider> createState() => _CorsalSliderState();
}

class _CorsalSliderState extends State<CorsalSlider> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.1),
      height: screenWidth(2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Container(
                    width: screenWidth(1.1),
                    height: screenWidth(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.mainColor,
                      image: DecorationImage(
                        image: AssetImage("assets/images/home/c$itemIndex.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: screenWidth(2.4)),
                    child: Center(
                      child: Container(
                        width: screenWidth(10),
                        height: screenWidth(30),
                        decoration: BoxDecoration(
                          color: AppColors.borwnColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SizedBox(
                          child: DotsIndicator(
                            dotsCount: 3,

                            position: itemIndex.toDouble(),

                            decorator: DotsDecorator(
                              spacing: EdgeInsets.all(2),
                              size: Size.fromRadius(3),
                              activeSize: Size.fromRadius(3),
                              color: AppColors.whiteColor, // Inactive color
                              activeColor: AppColors.mainColor,
                            ),
                          ),
                        ),
                        //  SmoothPageIndicator(
                        //     count: 3,

                        //     effect: SlideEffect(
                        //       spacing: screenWidth(80),
                        //       dotWidth: screenWidth(50),
                        //       dotHeight: screenWidth(50),
                        //       activeDotColor: AppColors.mainColor,
                        //       dotColor: AppColors.whiteColor,
                        //     ),
                        //     controller: PageController(),
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        options: CarouselOptions(
          height: screenWidth(1.1),
          clipBehavior: Clip.hardEdge,
          viewportFraction: 1,
          autoPlayCurve: Curves.linear,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 1.0,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
        ),
      ),
    );
  }
}
