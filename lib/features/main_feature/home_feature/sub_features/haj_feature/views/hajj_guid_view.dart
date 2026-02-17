import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/haj_feature/controllers/hajj_guid_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/haj_feature/views/hajj_form_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HajjGuideScreen extends StatelessWidget {
  final HajjGuideController controller = Get.put(HajjGuideController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStepByStepGuide(),
                    SizedBox(height: 30),
                    _buildFAQSection(),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight(40)),
            child: CustomButton(
              buttonText: 'اكمال',
              onTap: () {
                Get.to(HajjFormView());
              },
            ),
          ),
        ],
      ),
    );
  }

  //! ****************************------------------------*** */
  Widget _buildHeader() {
    return Container(
      height: screenHeight(5.5),
      width: screenWidth(1),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenWidth(15)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.whiteColor),
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  'دليل الحج والعمرة',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: screenWidth(8)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStepCircle(3, 'دفع'),
                _buildStepConnector(),
                _buildStepCircle(2, 'تطبيق'),
                _buildStepConnector(),
                _buildStepCircle(1, 'دليل', isActive: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepCircle(int step, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.whiteColor, width: 1.5),
            color: isActive ? Colors.white : Colors.transparent,
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                color: isActive ? Color(0xFFE3B02B) : AppColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: AppColors.whiteColor, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildStepConnector() {
    return SizedBox(
      width: 35,
      child: Divider(color: Colors.white, thickness: 1.6),
    );
  }

  Widget _buildStepByStepGuide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'دليل خطوة بخطوة',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 20),
        _buildGuideStep(
          '١: التحضير',
          'يدخل الحجاج حالة الطهارة والتفاني عن طريق عبور الحدود الخارجية لمكة وارتداء الثياب المبسطة. يدور الحجاج حول الكعبة سبع مرات باتجاه عقارب الساعة. يسير الحجاج أو يركضون بين تلال الصفا والمروة. يساق الحجاج إلى مدينة الخيام خارج مكة، حيث يقضون اليوم في الصلاة والتضرع.',
        ),
        SizedBox(height: 15),
        _buildGuideStep(
          '٢: تخطيط السفر',
          'الحجاج يسافرون إلى مينا، مدينة خيمية خارج مكة.',
        ),
        SizedBox(height: 15),
        _buildGuideStep(
          '٣: دليل الطقوس',
          'يدخل الحجاج في حالة من الطهارة والتفاني عن طريق العبور...',
        ),
      ],
    );
  }

  Widget _buildGuideStep(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }

  Widget _buildFAQSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أسئلة متكررة بشكل متكرر',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 15),
        _buildFaqItem(0, 'ما هي الوثائق الأساسية المطلوبة؟'),
        Divider(),
        _buildFaqItem(1, 'تفاصيل الحجز والإقامة.'),
        Divider(),
        _buildFaqItem(2, 'اكمل إجراءات الطقوس.'),
        Divider(),
        _buildFaqItem(3, 'كيف تقدم على تأشيرة؟'),
        Divider(),
        _buildFaqItem(4, 'ما هي التكاليف المشاركة؟'),
      ],
    );
  }

  Widget _buildFaqItem(int index, String question) {
    return GetX<HajjGuideController>(
      builder: (_) {
        return Column(
          children: [
            InkWell(
              onTap: () => controller.toggleFaq(index),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      controller.expandedFaqs[index]
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black54,
                    ),
                    Expanded(
                      child: Text(
                        question,
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (controller.expandedFaqs[index])
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  'هذه المعلومات الإضافية حول ${question.toLowerCase()}',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.right,
                ),
              ),
          ],
        );
      },
    );
  }
}

// Custom navigation icons for Hajj, Umrah, and Tours
class HajjIcon extends CustomPainter {
  final Color color;

  HajjIcon({this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw Kaaba icon
    final Path path = Path();
    path.moveTo(size.width * 0.1, size.height * 0.3);
    path.lineTo(size.width * 0.1, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.9);
    path.lineTo(size.width * 0.9, size.height * 0.3);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class UmrahIcon extends CustomPainter {
  final Color color;

  UmrahIcon({this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Draw pilgrim icon
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.3),
      size.width * 0.2,
      paint,
    );

    // Draw body
    final Path path = Path();
    path.moveTo(size.width * 0.3, size.height * 0.4);
    path.lineTo(size.width * 0.3, size.height * 0.9);
    path.lineTo(size.width * 0.7, size.height * 0.9);
    path.lineTo(size.width * 0.7, size.height * 0.4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ToursIcon extends CustomPainter {
  final Color color;

  ToursIcon({this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw map icon
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.3),
      size.width * 0.15,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.7),
      size.width * 0.15,
      paint,
    );

    // Draw line connecting the points
    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.3),
      Offset(size.width * 0.7, size.height * 0.7),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
