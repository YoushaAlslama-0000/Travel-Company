import 'package:bot_toast/bot_toast.dart';
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

void customLoader() => BotToast.showCustomLoading(
  toastBuilder: (context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      width: screenWidth(4),
      height: screenWidth(4),
      child: SpinKitCircle(color: AppColors.mainColor, size: screenWidth(8)),
    );
  },
);

Future<XFile?> chooseImage(ImageSource imageSource) async {
  return await ImagePicker().pickImage(source: imageSource);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait) {
    return Get.size.width / percent;
  } else {
    return Get.size.height / percent;
  }
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}
