import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/common/custom_widgets/custom_button.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/hotels_feature/controllers/hotal_details_controller.dart';
import 'package:flight_app/features/main_feature/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelsScreen extends StatelessWidget {
  final String label;
  final IconData icon;
  const HotelsScreen({required this.label, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: screenWidth(10),
          decoration: BoxDecoration(
            color: AppColors.borderGreyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(
              icon,
              color: AppColors.mainColor,
              size: screenWidth(20),
            ),
          ),
        ),
        SizedBox(width: screenWidth(40)),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: screenWidth(30),
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ReviewTile extends StatelessWidget {
  final Map<String, dynamic> review;
  const ReviewTile({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenHeight(40)),
      padding: EdgeInsets.all(screenWidth(40)),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderGreyColor),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.greyColorWithOpacity,
                child: Text(
                  review['name'][0],
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: screenWidth(40)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(24),
                        color: AppColors.blackColor,
                      ),
                    ),
                    Text(
                      review['date'],
                      style: TextStyle(
                        fontSize: screenWidth(30),
                        color: AppColors.textGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    review['rating'].toStringAsFixed(1),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(24),
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: screenWidth(100)),
                  ...List.generate(
                    5,
                    (index) => Icon(
                      index < review['rating'].floor()
                          ? Icons.star
                          : Icons.star_border,
                      color: AppColors.mainColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight(40)),
          Text(review['comment'], style: TextStyle(fontSize: screenWidth(25))),
        ],
      ),
    );
  }
}

class HotelDetailsPage extends StatelessWidget {
  const HotelDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HotelController());

    final List<Map<String, dynamic>> facilities = [
      {"label": "واي فاي مجاني", "icon": Icons.wifi},
      {"label": "مسبح", "icon": Icons.pool},
      {"label": "مطعم", "icon": Icons.restaurant},
      {"label": "خدمة الغرف", "icon": Icons.room_service},
      {"label": "سبا", "icon": Icons.spa},
      {"label": "مقهى", "icon": Icons.local_cafe},
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.secondwhiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/booking/Rectangle 1905.png',
                    fit: BoxFit.cover,
                    height: screenHeight(2.6),
                    width: 500,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: screenHeight(2.6),
                      color: AppColors.greyColor,
                      child: Center(child: Text("صورة الفندق (Placeholder)")),
                    ),
                  ),
                  Positioned(
                    top: screenHeight(20),
                    right: screenWidth(20),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        backgroundColor: AppColors.whiteColor.withOpacity(0.8),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: AppColors.blackColor,
                            size: screenWidth(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight(20),
                    left: screenWidth(20),
                    child: CircleAvatar(
                      backgroundColor: AppColors.whiteColor.withOpacity(0.8),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.redColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(screenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "هيلتون هوتلز آند ريزورتس",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.borwnColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: screenWidth(20),
                            ),
                            SizedBox(width: screenWidth(100)),
                            Obx(
                              () => Text(
                                controller.rating.value.toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              " (120 مراجعات)",
                              style: TextStyle(color: AppColors.textGreyColor),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: screenWidth(100)),

                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.redColor,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "هيلتون الرياض أوليا",
                          style: TextStyle(
                            fontSize: screenWidth(25),
                            color: AppColors.textGreyColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight(20)),

                    Text(
                      "الموقع",
                      style: TextStyle(
                        fontSize: screenWidth(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: screenHeight(40)),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/Screenshot 2024-12-29 at 10.20.59 1.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: screenWidth(1),
                          height: screenHeight(4),
                          color: AppColors.greyColorWithOpacity,
                          child: Center(
                            child: Text("خريطة الموقع (Placeholder)"),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight(40)),

                    Text(
                      "تسهيلات",
                      style: TextStyle(
                        fontSize: screenWidth(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    GridView.builder(
                      itemCount: facilities.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                        childAspectRatio: 4,
                      ),
                      itemBuilder: (context, index) {
                        final item = facilities[index];
                        return HotelsScreen(
                          label: item['label'],
                          icon: item['icon'],
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    Text(
                      "تقييمات",
                      style: TextStyle(
                        fontSize: screenWidth(20),
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: screenHeight(40)),

                    // Reviews List
                    Obx(
                      () => Column(
                        children: controller.reviews
                            .map((review) => ReviewTile(review: review))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(20),
                  vertical: screenHeight(40),
                ),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border(
                    top: BorderSide(color: AppColors.borderGreyColor, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      buttonWidth: screenWidth(2),
                      buttonText: "احجز الآن",
                      buttonColor: AppColors.mainColor,
                      onTap: () {
                        Get.offAll(() => MainView());
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "السعر لليلة",
                          style: TextStyle(
                            fontSize: screenWidth(20),
                            color: AppColors.textGreyColor,
                          ),
                        ),
                        Text(
                          "125 ريال/ليلة",
                          style: TextStyle(
                            fontSize: screenWidth(20),
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
