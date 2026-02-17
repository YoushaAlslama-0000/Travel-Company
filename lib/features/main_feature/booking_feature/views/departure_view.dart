import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/booking_feature/controllers/departure_controller.dart';
import 'package:flight_app/features/main_feature/booking_feature/views/choose_sit_view.dart';
import 'package:flight_app/features/main_feature/booking_feature/widgets/custom_app_bar.dart';
import 'package:flight_app/features/main_feature/booking_feature/widgets/custom_choose_day.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DepartureView extends StatelessWidget {
  DepartureView({super.key});

  DepartureController controller = Get.put(DepartureController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight(6)),
        child: CustomAppBar(title: 'رحيل', text: 'الاثنين 10 مارس 2025'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth(1),
              height: screenHeight(7.7),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: false,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomFirstCard(
                      date: " 31 مارس",
                      day: "الاربعاء",
                      isSelected: true,
                      onPressed: () {},
                      price: "500 ريال",
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'الخطوط الجوية السعودية',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 20),
                              Image.asset(
                                'assets/images/booking/668e68d1847a2841c9ada863 1.png',
                                height: 10,
                              ),
                            ],
                          ),
                          const Text(
                            '500 ريال',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '08:00',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'جدة',
                                style: TextStyle(color: AppColors.blackColor),
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_forward),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                '13:20',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'لاهور',
                                style: TextStyle(color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(
                            Icons.timer_outlined,
                            color: AppColors.blackColor,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '5 ساعات و 20 دقيقة',
                            style: TextStyle(color: AppColors.blackColor),
                          ),
                          Spacer(),
                          Icon(
                            Icons.flight_takeoff,
                            color: AppColors.blackColor,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'بدون توقف',
                            style: TextStyle(color: AppColors.blackColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(
                            Icons.airline_seat_recline_normal,
                            color: AppColors.blackColor,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'باقي 8 مقاعد',
                            style: TextStyle(color: AppColors.blackColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        buttonText: "يختار",
                        buttonColor: AppColors.mainColor,
                        onTap: () {
                          Get.to(ChooseSitView());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
