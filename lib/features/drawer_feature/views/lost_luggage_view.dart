// import 'package:flight_app/common/custom_utiles/colors.dart';
// import 'package:flight_app/features/drawer_feature/controllers/lost_luggage_controller.dart';
// import 'package:flight_app/features/drawer_feature/views/scheduled_trips_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flight_app/common/custom_utiles/functions_utils.dart';
// import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
// import 'package:get/get.dart';

// class LostLuggageView extends StatelessWidget {
//   LostLuggageView({super.key});

//   final controller = Get.put(LostLuggageController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text(
//           "الأمتعة المفقودة",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       ),
//       body: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth(22),
//                   vertical: screenWidth(25),
//                 ),
//                 child: Column(
//                   children: [
//                     _buildForm(context),
//                     SizedBox(height: screenHeight(20)),
//                     _submitButton(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🟡 INPUT FIELDS
//   Widget _buildForm(BuildContext context) {
//     return Column(
//       children: [
//         CustomTextField(
//           controller: controller.firstName,
//           label: "نوع المطالبة",
//           hint: "",
//         ),

//         CustomTextField(
//           controller: controller.firstName,
//           label: "الاسم الأول",
//           hint: "",
//         ),

//         CustomTextField(
//           controller: controller.lastName,
//           label: "الاسم الأخير (اللقب)",
//           hint: "",
//         ),

//         CustomTextField(
//           controller: controller.phone,
//           label: "رقم الهاتف",
//           hint: "",
//           keyboardType: TextInputType.phone,
//         ),

//         CustomTextField(
//           controller: controller.messageDate,
//           label: "تاريخ الرسالة",
//           hint: "YYYY/MM/DD",
//         ),

//         CustomTextField(
//           controller: controller.fromField,
//           label: "من",
//           hint: "",
//         ),

//         CustomTextField(controller: controller.toField, label: "إلى", hint: ""),

//         CustomTextField(
//           controller: controller.messageNumber,
//           label: "رقم الرسالة",
//           hint: "",
//         ),

//         CustomTextField(
//           controller: controller.ticketNumber,
//           label: "رقم التذكرة المرجعية للحجز",
//           hint: "",
//         ),

//         CustomTextField(
//           controller: controller.luggageReceipt,
//           label: "رقم إيصال الأمتعة",
//           hint: "",
//         ),

//         CustomTextField(
//           controller: controller.luggageColor,
//           label: "لون الحقيبة",
//           hint: "",
//         ),

//         const SizedBox(height: 10),
//         _bagSizeSection(),

//         CustomTextField(
//           controller: controller.notes,
//           label: "ملاحظات خاصة",
//           hint: "",
//         ),
//       ],
//     );
//   }

//   // 🟠 BAG SIZE (كبير – متوسط – صغير)
//   Widget _bagSizeSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "حجم",
//           style: TextStyle(
//             color: AppColors.mainColor,
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),
//         SizedBox(height: 10),
//         Obx(
//           () => Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [_chip("كبير", 0), _chip("متوسط", 1), _chip("صغير", 2)],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _chip(String label, int index) {
//     bool active = controller.selectedBagSize.value == index;

//     return GestureDetector(
//       onTap: () => controller.setBagSize(index),
//       child: Container(
//         width: screenWidth(4),
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: active ? AppColors.mainColor : Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: active ? Colors.white : AppColors.textGreyColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   // 🟡 SUBMIT BUTTON
//   Widget _submitButton() {
//     return GestureDetector(
//       onTap: () {
//         Get.to(ScheduledTripsView());
//       },
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         decoration: BoxDecoration(
//           color: const AppColors.mainColor,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Center(
//           child: Text(
//             "تقديم",
//             style: TextStyle(
//               fontSize: 17,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/features/drawer_feature/controllers/lost_luggage_controller.dart';
import 'package:flight_app/features/drawer_feature/views/scheduled_trips_view.dart';
import 'package:flutter/material.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/auth_feature/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class LostLuggageView extends StatelessWidget {
  LostLuggageView({super.key});

  final controller = Get.put(LostLuggageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "الأمتعة المفقودة",
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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(22),
                  vertical: screenWidth(25),
                ),
                child: Column(
                  children: [
                    _buildForm(context),
                    SizedBox(height: screenHeight(20)),
                    _submitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: controller.firstName,
          label: "نوع المطالبة",
          hint: "اختر نوع المطالبة (مثلاً: فقدان، تلف، تأخير)",
        ),
        CustomTextField(
          controller: controller.firstName,
          label: "الاسم الأول",
          hint: "ادخل الاسم الأول كما في جواز السفر",
        ),
        CustomTextField(
          controller: controller.lastName,
          label: "الاسم الأخير (اللقب)",
          hint: "ادخل الاسم الأخير كما في جواز السفر",
        ),
        CustomTextField(
          controller: controller.phone,
          label: "رقم الهاتف",
          hint: "ادخل رقم الهاتف مع رمز الدولة",
          keyboardType: TextInputType.phone,
        ),
        CustomTextField(
          controller: controller.messageDate,
          label: "تاريخ الرسالة",
          hint: "YYYY/MM/DD",
        ),
        CustomTextField(
          controller: controller.fromField,
          label: "من",
          hint: "ادخل مطار المغادرة",
        ),
        CustomTextField(
          controller: controller.toField,
          label: "إلى",
          hint: "ادخل مطار الوصول",
        ),
        CustomTextField(
          controller: controller.messageNumber,
          label: "رقم الرسالة",
          hint: "ادخل رقم رسالة الاستلام",
        ),
        CustomTextField(
          controller: controller.ticketNumber,
          label: "رقم التذكرة المرجعية للحجز",
          hint: "ادخل رقم التذكرة للحجز",
        ),
        CustomTextField(
          controller: controller.luggageReceipt,
          label: "رقم إيصال الأمتعة",
          hint: "ادخل رقم إيصال الأمتعة الصادر من الشركة",
        ),
        CustomTextField(
          controller: controller.luggageColor,
          label: "لون الحقيبة",
          hint: "مثلاً: أسود، أزرق، أحمر",
        ),
        const SizedBox(height: 10),
        _bagSizeSection(),
        CustomTextField(
          controller: controller.notes,
          label: "ملاحظات خاصة",
          hint: "أضف أي ملاحظات إضافية عن الأمتعة",
        ),
      ],
    );
  }

  Widget _bagSizeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "حجم",
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 10),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_chip("كبير", 0), _chip("متوسط", 1), _chip("صغير", 2)],
          ),
        ),
      ],
    );
  }

  Widget _chip(String label, int index) {
    bool active = controller.selectedBagSize.value == index;

    return GestureDetector(
      onTap: () => controller.setBagSize(index),
      child: Container(
        width: screenWidth(4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: active ? AppColors.mainColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : AppColors.textGreyColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        Get.to(ScheduledTripsView());
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "تقديم",
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
