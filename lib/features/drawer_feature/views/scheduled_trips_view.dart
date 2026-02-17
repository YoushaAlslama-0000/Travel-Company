import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/drawer_feature/controllers/scheduled_trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduledTripsView extends StatelessWidget {
  final ScheduledTripsController controller = Get.put(
    ScheduledTripsController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "الرحلات المجدولة",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),

      body: Column(
        children: [
          _filters(),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              itemCount: 3,
              itemBuilder: (_, i) {
                return _flightCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------- FILTER TABS -----------------------
  Widget _filters() {
    return Container(
      color: Color(0xFFE3B02B),
      padding: EdgeInsets.only(bottom: 15, left: 12, right: 12),
      child: Obx(
        () => Row(
          children: [
            _filterButton("رقم الرحلة", 0, Icons.numbers),
            SizedBox(width: 8),
            _filterButton("تاريخ الرحلة", 1, Icons.calendar_today),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String text, int index, IconData icon) {
    bool active = controller.selectedFilter.value == index;

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: TextStyle(
                color: AppColors.mainColor,
                fontSize: screenWidth(22),
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(icon, color: AppColors.mainColor, size: screenWidth(18)),
          ],
        ),
      ),
    );
  }

  // ----------------------- FLIGHT CARD -----------------------
  Widget _flightCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "BMO490",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                "رقم الرحلة",
                style: TextStyle(fontSize: 13, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LEFT — DESTINATION
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "لاهور",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text("11:30", style: TextStyle(color: Colors.grey)),
                  Text(
                    "الثلاثاء 04 مارس",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),

              // CENTER — PLANE LINE (YOUR IMAGE)
              Image.asset(
                "assets/images/home/plane-ticket.png",
                width: screenHeight(5.5),
                fit: BoxFit.contain,
              ),

              // RIGHT — ORIGIN
              Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "جدة",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text("11:40", style: TextStyle(color: Colors.grey)),
                  Text(
                    "الثلاثاء 04 مارس",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),

          Center(
            child: Text(
              "5 ساعات و 20 دقيقة ✈ بدون توقف",
              style: TextStyle(color: Colors.grey[600], fontSize: 12.5),
            ),
          ),
        ],
      ),
    );
  }
}
