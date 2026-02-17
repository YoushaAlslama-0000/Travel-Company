// lib/common/custom_utiles/app_dimensions.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // لاستخدام Get.width و Get.height

class AppDimensions {
  static double get screenWidth => Get.width;
  static double get screenHeight => Get.height;

  // الأبعاد الثابتة بناءً على نسب الشاشة
  static double get homeHeaderImageHeight => screenHeight / 3;
  static double get categoryRowTopSpacing => screenWidth / 6;
  static double get categoryIconSize => screenWidth / 6;
  static double get pointsCardMargin => 8.0;
  static double get profilePictureSize => screenWidth / 6;
  static double get smallHorizontalSpacing => screenWidth / 20;
  static double get pointsIconSize => screenWidth / 20;
  static double get pointsIconSmallSize => screenWidth / 30;
  static double get redeemButtonWidth => screenWidth / 5;
  static double get redeemButtonHeight => screenWidth / 12;
  static double get discoverDestinationsListHeight => screenWidth / 1.8;
  static double get destinationCardWidth => screenWidth / 2.6;
  static double get destinationCardHeight => screenWidth / 1.8;
  static double get destinationImageWidth => screenWidth / 3;
  static double get destinationImageHeight => screenWidth / 3.5;
  static double get destinationButtonWidth => screenWidth / 4;
  static double get destinationButtonHeight => screenWidth / 10;
  static double get upcomingFlightsListHeight => screenHeight / 2;
  static double get flightCardHeight => screenWidth / 2.5;
  static double get flightCardHeaderHeight => screenWidth / 10;
  static double get smallPadding => 8.0;
  static double get largePadding => 16.0;
  static double get defaultBorderRadius => 16.0;
  static double get smallBorderRadius => 10.0;
  static double get circularRadius => 50.0;
  static double get drawerIconSize => screenWidth / 8;
}
