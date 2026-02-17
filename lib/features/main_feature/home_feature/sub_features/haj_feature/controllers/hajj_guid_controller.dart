import 'package:get/get.dart';

class HajjGuideController extends GetxController {
  final RxInt currentStep = 1.obs;
  final RxBool isFaqExpanded = false.obs;
  final RxList<bool> expandedFaqs = List.generate(5, (_) => false).obs;

  void toggleFaq(int index) {
    for (int i = 0; i < expandedFaqs.length; i++) {
      expandedFaqs[i] = i == index ? !expandedFaqs[i] : false;
    }
  }
}
