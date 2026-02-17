import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/reward_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardsView extends GetView<RewardsController> {
  const RewardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('نقاطك'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/booking/Spin (1).png"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'النقاط الإجمالية',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Obx(
                        () => Text(
                          '${controller.totalPoints.value}',
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Obx(
                        () => Text(
                          '+${controller.pointsThisMonth.value} نقطة هذا الشهر',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.monetization_on,
                    size: 40.0,
                    color: Colors.amber,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // قسم الجوائز
            const Text(
              'الجوائز المتاحة',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.discountAndGiftCards.length,
                  itemBuilder: (context, index) {
                    final card = controller.discountAndGiftCards[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              card.name,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            if (card.expiryDate != null)
                              Text(
                                'صالح حتى: ${card.expiryDate}',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            // يمكنك إضافة المزيد من التفاصيل هنا
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
