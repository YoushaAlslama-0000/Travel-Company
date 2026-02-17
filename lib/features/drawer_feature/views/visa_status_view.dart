import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

double screenWidth(BuildContext context, double size) =>
    (MediaQuery.of(context).size.width / 430) * size;
double screenHeight(BuildContext context, double size) =>
    (MediaQuery.of(context).size.height / 932) * size;

class VisaStatusView extends StatefulWidget {
  const VisaStatusView({super.key});

  @override
  State<VisaStatusView> createState() => _VisaStatusViewState();
}

class _VisaStatusViewState extends State<VisaStatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondwhiteColor,

      appBar: AppBar(
        title: Text(
          'حالة التأشيرة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, 20),
          vertical: screenHeight(context, 15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVisaInfoCard(context),
            SizedBox(height: screenHeight(context, 20)),
            _buildUpdatesCard(context),
            SizedBox(height: screenHeight(context, 20)),
            CustomButton(
              buttonText: 'إغلاق',
              onTap: () {
                Get.offAll(() => MainView());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisaInfoCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth(context, 20)),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '#VS25789',
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: screenWidth(context, 18),
            ),
          ),
          SizedBox(height: screenHeight(context, 10)),
          Text(
            'تأشيرة سياحية',
            style: GoogleFonts.cairo(
              fontSize: screenWidth(context, 22),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight(context, 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStepItem(context, 'تقديم', true),
              Expanded(
                child: Divider(
                  color: AppColors.mainColor,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              _buildStepItem(context, 'يعالج', true),
              Expanded(
                child: Divider(
                  color: AppColors.greyColorWithOpacity,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              _buildStepItem(context, 'موافقة', false),
            ],
          ),
          SizedBox(height: screenHeight(context, 25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildInfoColumn(context, 'تاريخ التقديم', '15 يناير، 2025'),
              _buildInfoColumn(context, 'المعالجة المتوقعة', '5-7 أيام'),
              _buildInfoColumn(
                context,
                'الوضع الحالي',
                'تحت المراجعة',
                color: AppColors.mainColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(BuildContext context, String text, bool isActive) {
    return Column(
      children: [
        Container(
          width: screenWidth(context, 35),
          height: screenWidth(context, 35),
          decoration: BoxDecoration(
            color: isActive ? AppColors.mainColor : AppColors.borderGreyColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 18),
        ),
        SizedBox(height: screenHeight(context, 8)),
        Text(
          text,
          style: GoogleFonts.cairo(
            color: isActive ? AppColors.mainColor : AppColors.greyColor,
            fontSize: screenWidth(context, 16),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(
    BuildContext context,
    String title,
    String value, {
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.cairo(
            color: AppColors.greyColor,
            fontSize: screenWidth(context, 16),
          ),
        ),
        SizedBox(height: screenHeight(context, 5)),
        Text(
          value,
          style: GoogleFonts.cairo(
            color: color ?? AppColors.blackColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth(context, 16),
          ),
        ),
      ],
    );
  }

  Widget _buildUpdatesCard(BuildContext context) {
    final updates = [
      {'text': 'تم التحقق من التطبيق', 'time': '10:30 صباحاً'},
      {'text': 'المراجعة الأولية بدأت', 'time': '15 يناير، 2025 مساءً'},
      {'text': 'تم تقديم الطلب', 'time': '15 يناير 2025'},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(screenWidth(context, 20)),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'التحديثات الأخيرة',
            style: GoogleFonts.cairo(
              fontSize: screenWidth(context, 20),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight(context, 10)),
          ...updates.map((update) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight(context, 10),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: AppColors.mainColor),
                  SizedBox(width: screenWidth(context, 10)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          update['text']!,
                          style: GoogleFonts.cairo(
                            fontSize: screenWidth(context, 16),
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          update['time']!,
                          style: GoogleFonts.cairo(
                            fontSize: screenWidth(context, 14),
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
