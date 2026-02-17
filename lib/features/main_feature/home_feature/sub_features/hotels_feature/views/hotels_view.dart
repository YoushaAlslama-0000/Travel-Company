import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flight_app/common/custom_utiles/functions_utils.dart';
import 'package:flight_app/features/main_feature/home_feature/sub_features/hotels_feature/views/hotels_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hotel {
  final String name;
  final String description;
  final String location;
  final double rating;
  final int reviews;
  final double price;
  final String imageUrl;
  final String buttonText;

  Hotel({
    required this.name,
    required this.description,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.imageUrl,
    required this.buttonText,
  });
}

class HotelsController extends GetxController {
  var hotels = <Hotel>[
    Hotel(
      name: "انتركونتيننتال",
      description:
          "تجربة الضيافة الفاخرة، الأحداث المميزة، واللمسات العصرية في فنادق ومنتجعات انتركونتيننتال.",
      location: "الرياض، السعودية",
      rating: 5.0,
      reviews: 88,
      price: 125,
      imageUrl: "assets/images/booking/hotel1.png",
      buttonText: "اطلع على التفاصيل",
    ),
    Hotel(
      name: "هيلتون هوتلز و ريزورتس",
      description:
          "تجربة ضيافة مريحة وخدمات استثنائية في فنادق ومنتجعات هيلتون.",
      location: "الرياض، السعودية",
      rating: 5.0,
      reviews: 48,
      price: 125,
      imageUrl: "assets/images/booking/hotel2.png",
      buttonText: "مشاهدة التفاصيل",
    ),
  ].obs;
}

class HotelsScreen extends StatelessWidget {
  final controller = Get.put(HotelsController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.arrow_back, color: AppColors.blackColor),
            ),
          ),
          title: Text(
            "فنادق",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                color: AppColors.blackColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  hintText: "البحث عن الفنادق",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.hotels.length,
                  itemBuilder: (context, index) {
                    final hotel = controller.hotels[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Stack(
                              children: [
                                Image.asset(
                                  hotel.imageUrl,
                                  height: screenHeight(5),
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: screenHeight(40),
                                  right: screenWidth(40),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth(40),
                                      vertical: screenWidth(100),
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                          size: 16,
                                        ),
                                        SizedBox(width: screenWidth(100)),
                                        Text(
                                          hotel.location,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth(40)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotel.name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(height: screenHeight(80)),
                                Text(
                                  hotel.description,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade700,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth(40)),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    SizedBox(width: screenWidth(100)),
                                    Text(
                                      "${hotel.rating} (${hotel.reviews} التقييمات)",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight(40)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () =>
                                            Get.to(() => HotelDetailsPage()),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.mainColor,
                                          padding: EdgeInsets.symmetric(
                                            vertical: screenWidth(40),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          hotel.buttonText,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: screenWidth(40)),
                                    Text(
                                      "${hotel.price.toInt()} ريال/ليلة",
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
