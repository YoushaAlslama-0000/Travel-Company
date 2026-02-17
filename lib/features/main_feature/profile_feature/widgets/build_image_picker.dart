import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/main_feature/profile_feature/controllers/profile_controller.dart';
import 'package:flight_app/features/main_feature/profile_feature/widgets/build_image_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BuildImagePickerSection extends GetView<ProfileController> {
  const BuildImagePickerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        splashColor: AppColors.transparentColor,
        highlightColor: AppColors.transparentColor,
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor:
                Colors.transparent, // Important for rounded corners
            builder: (BuildContext context) {
              return BuildImagePickerSheet(
                onImageSourceSelected: (ImageSource source) {
                  controller.pickImage(source);
                },
              );
            },
          );
        },
        child: Obx(() {
          return Stack(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.secondBlackColor, // Fallback color
                backgroundImage: controller.image.value != null
                    ? FileImage(controller.image.value!)
                    : null,
                child: controller.image.value == null
                    ? const Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.mainColor,
                      )
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: screenWidth(15),
                  height: screenWidth(15),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.mode_edit_outlined,
                    color: AppColors.whiteColor,
                    size: screenWidth(20),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
