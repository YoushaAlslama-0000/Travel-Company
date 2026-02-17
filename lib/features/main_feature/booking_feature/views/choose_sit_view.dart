import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/booking_feature/views/payment_view.dart';
import 'package:flight_app/features/main_feature/booking_feature/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChooseSitView extends StatelessWidget {
  ChooseSitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight(6)),
        child: CustomAppBar(title: 'حدد المقعد', text: '05h 30m'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: SvgPicture.asset("assets/images/booking/Seats.svg")),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomButton(
                buttonText: "أكمل",
                buttonColor: AppColors.mainColor,
                onTap: () {
                  Get.to(PaymentView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
