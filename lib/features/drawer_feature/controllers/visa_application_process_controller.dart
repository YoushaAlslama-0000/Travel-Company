import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart'; // لاستخدام خط كايرو في الـ snackbar إن أردت

class VisaApplicationController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passportNumberController = TextEditingController();
  final Rx<DateTime?> selectedDateOfBirth = Rx<DateTime?>(null);
  final RxString selectedCountry = ''.obs;

  final Rx<File?> personalPhoto = Rx<File?>(null);
  final Rx<File?> passportDocument = Rx<File?>(null); // يمكن أن يكون PDF أو صورة

  final ImagePicker _picker = ImagePicker();

  @override
  void onClose() {
    fullNameController.dispose();
    passportNumberController.dispose();
    super.onClose();
  }

  // دالة لاختيار تاريخ الميلاد مع تخصيص شكل الـ DatePicker
  Future<void> pickDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateOfBirth.value ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFFFA000), // لون شريط العنوان والرأس
              onPrimary: Colors.white, // لون النص على primary
              surface: Colors.white, // لون خلفية التقويم
              onSurface: Colors.black, // لون الأيام/الأرقام
            ),
            dialogBackgroundColor: Colors.white, // خلفية نافذة الحوار
            textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme), // تطبيق خط كايرو على النص في الـ picker
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFFFA000), // لون الأزرار (Cancel, OK)
                textStyle: GoogleFonts.cairo(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDateOfBirth.value) {
      selectedDateOfBirth.value = picked;
    }
  }

  void selectCountry(String? country) {
    if (country != null) {
      selectedCountry.value = country;
    }
  }

  Future<void> pickPersonalPhoto() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      personalPhoto.value = File(image.path); // تحويل XFile إلى File
    }
  }

  Future<void> pickPassportDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'], // السماح بـ PDF والصور
    );

    if (result != null && result.files.single.path != null) {
      passportDocument.value = File(result.files.single.path!);
    } else {
      // المستخدم ألغى الاختيار
      print('File picking canceled by user.');
    }
  }

  void continueApplication() {
    final String fullName = fullNameController.text;
    final String passportNumber = passportNumberController.text;
    final DateTime? dateOfBirth = selectedDateOfBirth.value;
    final String country = selectedCountry.value;
    final File? personalPic = personalPhoto.value;
    final File? passportDoc = passportDocument.value;

    // مثال على التحقق من البيانات
    if (fullName.isEmpty || passportNumber.isEmpty || dateOfBirth == null || country.isEmpty || personalPic == null || passportDoc == null) {
      Get.snackbar(
        'خطأ',
        'الرجاء تعبئة جميع الحقول وتحميل الملفات المطلوبة.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
        margin: const EdgeInsets.all(10),
        borderRadius: 10,
        // يمكنك تخصيص الخط هنا أيضاً
        // textDirection: TextDirection.rtl, // إذا كانت اللغة العربية
        // titleText: Text('خطأ', style: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold)),
        // messageText: Text('الرجاء تعبئة جميع الحقول وتحميل الملفات المطلوبة.', style: GoogleFonts.cairo(color: Colors.white)),
      );
      return;
    }

    Get.snackbar(
      'نجاح',
      'تم إرسال بيانات الطلب بنجاح (المحاكاة).',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.7),
      colorText: Colors.white,
      snackStyle: SnackStyle.FLOATING,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
    );
    print('Full Name: $fullName');
    print('Passport Number: $passportNumber');
    print('Date of Birth: ${dateOfBirth.toIso8601String()}');
    print('Country: $country');
    print('Personal Photo Path: ${personalPic.path}');
    print('Passport Document Path: ${passportDoc.path}');
  }
}