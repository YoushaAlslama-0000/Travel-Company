import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/drawer_feature/controllers/f&q_controller.dart';
import 'package:flight_app/features/drawer_feature/widgets/custom_f&q_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQView extends GetView<FAQController> {
  const FAQView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'شائعات',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            CustomFAQItem(
              title: 'كيف يمكنني إلغاء أو حذف الحجز؟',
              content:
                  'سيتم عرض معلومات حول كيفية إلغاء أو حذف الحجز هنا.سيتم عرض معلومات حول كيفية إلغاء أو حذف الحجز هنا.سيتم عرض معلومات حول كيفية إلغاء أو حذف الحجز هنا.سيتم عرض معلومات حول كيفية إلغاء أو حذف الحجز هنا.',
            ),
            SizedBox(height: 8),
            CustomFAQItem(
              title: 'تفاصيل الحجز والإقامة.',
              content:
                  'سيتم عرض تفاصيل حول الحجز والإقامة هنا.سيتم عرض تفاصيل حول الحجز والإقامة هنا.سيتم عرض تفاصيل حول الحجز والإقامة هنا.سيتم عرض تفاصيل حول الحجز والإقامة هنا.',
            ),
            SizedBox(height: 8),
            CustomFAQItem(
              title: 'كيف يمكنني استرداد تذكرتي؟',
              content:
                  'سيتم عرض معلومات حول كيفية استرداد التذكرة هنا.سيتم عرض معلومات حول كيفية استرداد التذكرة هنا.سيتم عرض معلومات حول كيفية استرداد التذكرة هنا.سيتم عرض معلومات حول كيفية استرداد التذكرة هنا.',
            ),
            SizedBox(height: 8),
            CustomFAQItem(
              title: 'كيفية تقديم طلب للحصول على تأشيرة؟',
              content:
                  'سيتم عرض معلومات حول كيفية تقديم طلب التأشيرة هنا.سيتم عرض معلومات حول كيفية تقديم طلب التأشيرة هنا.سيتم عرض معلومات حول كيفية تقديم طلب التأشيرة هنا.سيتم عرض معلومات حول كيفية تقديم طلب التأشيرة هنا.',
            ),
          ],
        ),
      ),
    );
  }
}
