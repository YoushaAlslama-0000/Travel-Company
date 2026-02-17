import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? text;
  const CustomAppBar({super.key, required this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(screenHeight(6)),
      child: Container(
        width: screenWidth(1),
        height: screenHeight(1),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidth(30),
            vertical: screenWidth(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenWidth(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: AppColors.whiteColor,
                      size: screenWidth(12),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: screenWidth(16),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset("assets/images/booking/Filter.png"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "جدة",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: screenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(100),
                              vertical: screenWidth(150),
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColorWithopacity,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "اقتصاد",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: screenWidth(30),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth(5)),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth(100),
                              vertical: screenWidth(150),
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColorWithopacity,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "راكب واحد",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: screenWidth(30),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/images/booking/Frame 924.svg",
                        color: AppColors.whiteColor,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth(100),
                          vertical: screenWidth(150),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColorWithopacity,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          text!,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: screenWidth(30),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "لاهور",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: screenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
