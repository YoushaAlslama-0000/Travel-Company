import 'dart:io';

import 'package:flight_app/common/repsoistries/shared_prefrence_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final Rx<File?> image = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      SharedPrefrenceRepository().setProfileImagePath(pickedFile.path);
    }
  }

  void _loadInitialData() {
    final imagePath = SharedPrefrenceRepository().getProfileImagePath();
    if (imagePath.isNotEmpty) {
      image.value = File(imagePath);
    }
  }

  @override
  void onInit() {
    _loadInitialData();
    super.onInit();
  }
}
