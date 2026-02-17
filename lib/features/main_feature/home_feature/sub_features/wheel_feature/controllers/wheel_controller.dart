import 'dart:async';

import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/common/enum.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/common/model.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/prize_won_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/controllers/reward_controller.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/wheel_feature/views/prize_won_view.dart';
import 'package:get/get.dart';
import 'dart:math';
class WheelController extends GetxController {
  RxInt remainingSpins = 20.obs; // تم تغييرها الى 2 مثل ماهو موجود بالصورة
  RxList<String> previousWins = <String>[].obs;
  RxBool isSpinning = false.obs;
  Rx<Prize?> currentReward = Rxn<Prize>(); // لتخزين الجائزة مؤقتاً

  final List<String> prizes = [
    '50 نقطة',
    "",
    '20% تخفيض',
    "",
    'هدية مفاجأة',
    "",
    '100 نقطة',
    "",
    '50% خصم',
    "",
    '50 نقطة',
    "",
    'هدية مفاجأة',
    "",
    '20% تخفيض',
    "",
  ];

  final List<Prize> previousPrizeDetails =
      [
        Prize(
          name: 'نصف السعر',
          expiryDate: '15 مارس 2025',
          type: PrizeType.DISCOUNT,
        ),
        Prize(
          name: '100 نقطة مكافأة',
          expiryDate: '15 مارس 2025',
          isClaimed: true,
          type: PrizeType.POINTS,
        ),
      ].obs;

  final StreamController<int> wheelController = StreamController<int>();
  final RxInt currentIndex = RxInt(0);

  @override
  void onClose() {
    wheelController.close();
    super.onClose();
  }

  void startSpinning() {
    _spinWheel();
  }

  void spinWheelWithAnimation() {
    _spinWheel();
  }

  void _spinWheel() {
    if (remainingSpins > 0 && !isSpinning.value) {
      isSpinning.value = true;
      remainingSpins.value--;
      currentIndex.value = Random().nextInt(prizes.length);
      wheelController.add(currentIndex.value);

      Future.delayed(const Duration(seconds: 5), () {
        isSpinning.value = false;
        final winningPrize = prizes[currentIndex.value];
        previousWins.add(winningPrize);

        print('الجائزة الفائزة: $winningPrize');

        if (winningPrize == 'فرصة أخرى') {
          remainingSpins.value++;
          Get.snackbar(
            'فرصة أخرى!',
            'حصلت على فرصة دوران إضافية.',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else if (winningPrize.isEmpty) {
          Get.snackbar('لم تربح شيئاً', 'حاول مرة أخرى.');
        } else {
          // هنا يتم تحديد نوع الجائزة وتخزينها
          if (winningPrize.contains('نقطة')) {
            currentReward.value = Prize(
              name: winningPrize,
              type: PrizeType.POINTS,
            );
          } else if (winningPrize.contains('%') ||
              winningPrize.contains('خصم')) {
            currentReward.value = Prize(
              name: winningPrize,
              type: PrizeType.DISCOUNT,
            );
          } else if (winningPrize.contains('هدية')) {
            currentReward.value = Prize(
              name: winningPrize,
              type: PrizeType.GIFT,
            );
          }
          Get.lazyPut(() => CelebrationController());
          Get.lazyPut(() => RewardsController());
          Get.to(CelebrationView()); // الانتقال الى صفحة الاحتفال
        }
      });
    } else if (remainingSpins.value == 0) {
      Get.snackbar('لا يوجد دورات', 'لقد استنفدت جميع دوراتك.');
    }
  }
}
