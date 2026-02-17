import 'package:get/get.dart';

class HotelController extends GetxController {
  // Calculated average rating from reviews (Example adjustment for visual diversity)
  var rating = 4.7.obs;

  var reviews = <Map<String, dynamic>>[
    {
      "name": "عبدالرحمن",
      "date": "مارس 10, 2025",
      "rating": 5.0,
      "comment":
          "جدول الرحلة مرتبًا بشكل جيد، ولكننا شعرنا بالعجلة ولم نتمكن من الاستمتاع كامل وقتنا في ديزني لاند. كان من الجيد لو...",
      "avatar_asset": 'assets/images/booking/avatar1.png',
    },
    {
      "name": "رحيم البرار",
      "date": "مارس 6, 2025",
      "rating": 4.2,
      "comment":
          "جدول الجولة كان منطقيًا بشكل جيد ، لكننا شعرنا بالإسراع ولم نتمكن من التمتع بوقتنا في ديزني لاند بالكامل. كان من المفترض أن يكون...",
      "avatar_asset": 'assets/images/booking/avatar2.png',
    },
  ].obs;

  final selectedPaymentMethod = Rx<String?>(null);

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }
}
