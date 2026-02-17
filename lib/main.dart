import 'package:flight_app/app/my_app.dart';
import 'package:flight_app/common/repsoistries/shared_prefrence_repository.dart';
import 'package:flight_app/features/auth_feature/controllers/login_controller.dart';
import 'package:flight_app/features/auth_feature/controllers/signup_controller.dart';
import 'package:flight_app/features/main_feature/booking_feature/controllers/payment_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/haj_feature/controllers/haj_form_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/wheel_controller.dart';
import 'package:flight_app/features/main_feature/main_controller.dart';
import 'package:flight_app/features/main_feature/my_trip_feature/controllers/my_tirp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  Get.lazyPut(() => SharedPrefrenceRepository(), fenix: true);
  Get.lazyPut(() => PaymentController(), fenix: true);
  Get.lazyPut(() => SignUpController(), fenix: true);
  Get.lazyPut(() => LogInController(), fenix: true);
  Get.lazyPut(() => MainController(), fenix: true);
  Get.lazyPut(() => WheelController(), fenix: true);
  Get.lazyPut(() => MyTirpController(), fenix: true);
  Get.lazyPut(() => HajjAppController(), fenix: true);
  Get.put(MainController(), permanent: true);

  runApp(const MyApp());
}
