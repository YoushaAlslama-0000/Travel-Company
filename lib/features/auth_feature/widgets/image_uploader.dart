import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ImageUploader extends StatefulWidget {
  final String label;
  final String buttonText;
  final bool isPdf;

  const ImageUploader({
    Key? key,
    required this.label,
    required this.buttonText,
    this.isPdf = false,
  }) : super(key: key);

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  String? fileName; // لتخزين اسم الملف المرفوع

  Future<void> _pickFile() async {
    if (widget.isPdf) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null && result.files.isNotEmpty) {
        setState(() {
          fileName = result.files.single.name;
        });
        print('PDF selected: $fileName');
      } else {
        print('No PDF selected.');
      }
    } else {
      print('Image uploader tapped for: ${widget.label}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: screenWidth(25),
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor,
            ),
          ),
          SizedBox(height: screenHeight(50)),
          GestureDetector(
            onTap: _pickFile,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: screenWidth(40)),
              decoration: BoxDecoration(
                color: fileName != null
                    ? AppColors.greenColor.withOpacity(0.2)
                    : AppColors.greyColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: BoxBorder.all(
                  width: 0.5,
                  color: fileName != null
                      ? AppColors.greenColor.withOpacity(0.2)
                      : AppColors.mainColor,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    fileName != null
                        ? Icons.check_circle_outline
                        : (widget.isPdf
                              ? Icons.picture_as_pdf
                              : Icons.camera_alt_outlined),
                    color: fileName != null
                        ? AppColors.greenColor
                        : AppColors.greyColor,
                    size: screenWidth(10),
                  ),
                  SizedBox(height: screenWidth(50)),
                  Text(
                    fileName ?? widget.buttonText,
                    style: TextStyle(
                      color: fileName != null
                          ? AppColors.greenColor
                          : AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
