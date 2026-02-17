// lib/features/main_feature/home_feature/controllers/home_controller.dart
import 'package:flight_app/features/main_feature/home_feature/models/destination_model.dart';
import 'package:flight_app/features/main_feature/home_feature/models/flight_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/haj_feature/views/hajj_guid_view.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/hotels_feature/views/hotels_view.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/bindings/wheel_binding.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/views/wheel_view.dart';

class HomeController extends GetxController {
  var totalPoints = 575776.obs;
  final CarouselController carouselController =
      CarouselController(); // يمكن نقلها هنا إذا كان الـ controller سيدير الكاروسيل
  final PageController pageController = PageController(
    initialPage: 0,
  ); // نفس الشيء لـ PageController

  // قائمة الفئات الديناميكية
  final RxList<Map<String, String>> categories = <Map<String, String>>[
    {
      'imageUrl': "assets/images/home/cat1.png",
      'title': 'الحج',
      'route': '/hajj',
    },
    {
      'imageUrl': "assets/images/home/cat2.png",
      'title': 'الفنادق',
      'route': '/hotels',
    },
    {
      'imageUrl': "assets/images/home/cat3.png",
      'title': 'السفن',
      'route': '/ships',
    },
    {
      'imageUrl': "assets/images/home/cat4.png",
      'title': 'رحلة جوية',
      'route': '/flights',
    },
    {
      'imageUrl': "assets/images/home/cat5.png",
      'title': 'جائزة',
      'route': '/wheel',
    },
  ].obs;

  // قائمة الوجهات الديناميكية
  final RxList<DestinationModel> destinations = <DestinationModel>[
    DestinationModel(
      name: 'اسطنبول',
      imageUrl: "assets/images/home/cou2.png",
      price: 500,
    ),
    DestinationModel(
      name: 'باريس',
      imageUrl: "assets/images/home/cou2.png",
      price: 700,
    ), // مثال
    DestinationModel(
      name: 'لندن',
      imageUrl: "assets/images/home/cou2.png",
      price: 650,
    ), // مثال
    DestinationModel(
      name: 'دبي',
      imageUrl: "assets/images/home/cou2.png",
      price: 400,
    ), // مثال
    DestinationModel(
      name: 'القاهرة',
      imageUrl: "assets/images/home/cou2.png",
      price: 350,
    ), // مثال
    DestinationModel(
      name: 'نيويورك',
      imageUrl: "assets/images/home/cou2.png",
      price: 900,
    ), // مثال
  ].obs;

  // قائمة الرحلات القادمة الديناميكية
  final RxList<FlightModel> upcomingFlights = <FlightModel>[
    FlightModel(
      flightNumber: 'BMO490',
      departureCity: 'جدة',
      arrivalCity: 'لاهور',
      departureTime: '11:40',
      arrivalTime: '11:30',
      duration: '5 ساعات و 20 دقيقة',
      stopOver: 'بدون توقف',
      date: 'الثلاثاء 04 مارس',
    ),
    FlightModel(
      flightNumber: 'XYZ789',
      departureCity: 'الرياض',
      arrivalCity: 'دبي',
      departureTime: '08:00',
      arrivalTime: '10:30',
      duration: '2 ساعات و 30 دقيقة',
      stopOver: 'بدون توقف',
      date: 'الأربعاء 05 مارس',
    ),
    // يمكنك إضافة المزيد من الرحلات هنا
  ].obs;

  // منطق التنقل للفئات
  void navigateToCategory(String route) {
    switch (route) {
      case '/hajj':
        Get.to(() => HajjGuideScreen());
        break;
      case '/hotels':
        Get.to(() => HotelsScreen());
        break;
      case '/wheel':
        Get.to(
          () => WheelView(),
          binding: WheelBinding(),
          transition: Transition.fade,
          duration: const Duration(milliseconds: 500),
        );
        break;
      // أضف حالات أخرى للفئات الجديدة هنا
      case '/ships':
        // Get.to(() => ShipsView()); // افترض وجود هذه الواجهة
        Get.snackbar("تنبيه", "واجهة السفن غير جاهزة بعد!");
        break;
      case '/flights':
        // Get.to(() => FlightsView()); // افترض وجود هذه الواجهة
        Get.snackbar("تنبيه", "واجهة الرحلات الجوية غير جاهزة بعد!");
        break;
      default:
        Get.snackbar("خطأ", "مسار غير معروف: $route");
    }
  }

  // منطق استرداد النقاط
  void redeemPoints() {
    Get.snackbar("نقاط", "تم استرداد النقاط بنجاح!");
    // يمكنك إضافة منطق تحديث النقاط هنا
    // totalPoints.value = totalPoints.value - someValue;
  }

  // يمكن إضافة دوال لـ onTap للوجهات والرحلات هنا
  void onDestinationTap(DestinationModel destination) {
    Get.toNamed('/destination_details', arguments: destination);
    // أو أي منطق آخر
  }

  void onFlightTap(FlightModel flight) {
    Get.toNamed('/flight_details', arguments: flight);
    // أو أي منطق آخر
  }

  // عند تهيئة الـ Controller
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
