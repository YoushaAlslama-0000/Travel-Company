import 'package:get/get.dart';

class SelectVisaCountryController extends GetxController {
  RxString selectedCountry = ''.obs;
  final List<Map<String, String>> countries = [
    {
      'name': 'الإمارات العربية المتحدة',
      'flagSvgUrl':
          'assets/images/drawer_pages/AE.svg',
    },
    {
      'name': 'كينيا',
      'flagSvgUrl':
          'assets/images/drawer_pages/KE.svg',
    },
    {
      'name': 'أوغندا',
      'flagSvgUrl':
          'assets/images/drawer_pages/UG.svg',
    },
    {
      'name': 'جنوب السودان',
      'flagSvgUrl':
          'assets/images/drawer_pages/SS.svg',
    },
    // يمكنك إضافة المزيد من البلدان هنا
  ];

  void selectCountry(String countryName) {
    selectedCountry.value = countryName;
  }

  bool isCountrySelected(String countryName) {
    return selectedCountry.value == countryName;
  }
}
