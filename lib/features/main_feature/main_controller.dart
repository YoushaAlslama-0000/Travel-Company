import 'package:flight_app/common/repsoistries/shared_prefrence_repository.dart';
import 'package:flight_app/features/main_feature/agent_feature/views/agent_view.dart';
import 'package:flight_app/features/main_feature/booking_feature/views/flight_view.dart';
import 'package:flight_app/features/main_feature/home_feature/views/home_view.dart';
import 'package:flight_app/features/main_feature/main_view.dart';
import 'package:flight_app/features/main_feature/my_trip_feature/views/my_tirp_view.dart';
import 'package:flight_app/features/main_feature/profile_feature/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  // تم إزالة GlobalKey من هنا
  var cuurentIndex = 0.obs;
  void navToIndex(int index) {
    cuurentIndex.value = index;
  }

  void changePage(int index) {
    cuurentIndex.value = index;
  }

  final _drawerOpen = false.obs;
  bool get isDrawerOpen => _drawerOpen.value;

  void openDrawer() {
    MainView.scaffoldKey.currentState?.openDrawer();
    _drawerOpen.value = true;
  }

  void closeDrawer(context) {
    Navigator.pop(context);
    _drawerOpen.value = false;
  }

  List<Widget> pages = [
    HomeView(key: ValueKey("HomeView")),
    MyTripView(key: ValueKey("MyTripView")),
    FlightBookingView(key: ValueKey("FlightBookingView")),
    AgentView(key: ValueKey("AgentView")),
    ProfileView(key: ValueKey("ProfileView")),
  ];
  Widget get currentView => pages[cuurentIndex.value];
  @override
  void onInit() {
    SharedPrefrenceRepository().setIsLogged(true);

    super.onInit();
  }
}
