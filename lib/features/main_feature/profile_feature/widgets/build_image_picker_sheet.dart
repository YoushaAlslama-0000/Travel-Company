// pluto_app/ui/shared/custom_widgets/image_source_sheet.dart
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BuildImagePickerSheet extends StatelessWidget {
  final Function(ImageSource) onImageSourceSelected;

  const BuildImagePickerSheet({super.key, required this.onImageSourceSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(
              Icons.photo_library,
              color: AppColors.mainColor,
            ),
            title: const Text(
              'المعرض',
              style: TextStyle(color: AppColors.blackColor),
            ),
            onTap: () {
              onImageSourceSelected(ImageSource.gallery);
              Get.back(); // Close the bottom sheet
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera, color: AppColors.mainColor),
            title: const Text(
              'الكاميرا',
              style: TextStyle(color: AppColors.blackColor),
            ),
            onTap: () {
              onImageSourceSelected(ImageSource.camera);
              Get.back(); // Close the bottom sheet
            },
          ),
        ],
      ),
    );
  }
}
