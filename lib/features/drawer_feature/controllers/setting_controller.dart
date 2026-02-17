import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxBool notificationsEnabled = true.obs;

  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
  }
}
