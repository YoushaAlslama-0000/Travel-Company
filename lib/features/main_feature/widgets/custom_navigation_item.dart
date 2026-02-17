import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function onTap;
  final bool isPofile;
  final bool? isLogOut;
  final Color? iconColor;

  const CustomNavigationItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    required this.isPofile,
    this.iconColor,
    this.isLogOut,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },

      child: Container(
        width: screenWidth(1.17),
        height: screenHeight(16),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),

          border: Border.all(color: AppColors.greyColorWithOpacity),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isPofile
                ? Container(
                    width: screenWidth(10),
                    height: screenWidth(10),
                    decoration: BoxDecoration(
                      color: iconColor!.withOpacity(0.4),

                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            imageUrl,
                            fit: BoxFit.contain,

                            color: iconColor,
                            placeholderBuilder: (BuildContext context) =>
                                CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: screenWidth(16.5),
                    height: screenHeight(16.6),
                    child: SvgPicture.asset(
                      imageUrl,
                      color: AppColors.blackColor,
                      placeholderBuilder: (BuildContext context) =>
                          CircularProgressIndicator(),
                    ),
                  ),
            SizedBox(width: screenWidth(32)),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Spacer(),
            isLogOut == true ? SizedBox() : Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
