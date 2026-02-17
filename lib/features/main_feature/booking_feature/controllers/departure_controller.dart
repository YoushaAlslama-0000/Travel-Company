import 'package:flight_app/features/main_feature/booking_feature/widgets/flight_model.dart';
import 'package:get/get.dart';

class DepartureController extends GetxController {
  final RxString selectedDepartureCity = 'جدة'.obs;
  final RxString selectedArrivalCity = 'لاهور'.obs;
  final Rx<DateTime> selectedDepartureDate = DateTime.now().obs;
  final RxList<Flight> availableFlights = <Flight>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // يمكنك هنا استدعاء دالة لجلب الرحلات المتاحة عند بدء تشغيل وحدة التحكم
    fetchAvailableFlights();
  }

  Future<void> fetchAvailableFlights() async {
    isLoading.value = true;
    // قم هنا بمنطق جلب بيانات الرحلات بناءً على المدن والتاريخ المحدد
    // مثال لبيانات وهمية:
    await Future.delayed(const Duration(seconds: 2));
    availableFlights.value = [
      Flight(
        departureCity: 'جدة',
        arrivalCity: 'لاهور',
        departureDate: DateTime.now().add(const Duration(days: 2)),
        departureTime: '08:00',
        arrivalDate: DateTime.now().add(const Duration(days: 2)),
        arrivalTime: '13:20',
        price: 500.00,
        airline: 'الخطوط الجوية السعودية',
        duration: '5 ساعات و 20 دقيقة',
        availableSeats: 8,
      ),
      Flight(
        departureCity: 'جدة',
        arrivalCity: 'لاهور',
        departureDate: DateTime.now().add(const Duration(days: 3)),
        departureTime: '10:00',
        arrivalDate: DateTime.now().add(const Duration(days: 3)),
        arrivalTime: '15:40',
        price: 550.00,
        airline: 'طيران ناس',
        duration: '5 ساعات و 40 دقيقة',
        availableSeats: 12,
      ),
    ];
    isLoading.value = false;
  }

  void updateDepartureCity(String city) {
    selectedDepartureCity.value = city;
  }

  void updateArrivalCity(String city) {
    selectedArrivalCity.value = city;
  }

  void updateDepartureDate(DateTime date) {
    selectedDepartureDate.value = date;
  }

  // يمكنك إضافة المزيد من الدوال هنا للتعامل مع تفاعلات المستخدم ومنطق الأعمال
}
