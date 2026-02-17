import 'package:flight_app/features/main_feature/agent_feature/views/agent-model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AgentViewController extends GetxController {
  // متغيرات حالة تفاعلية باستخدام GetX
  final RxList<Agent> agents = <Agent>[].obs;
  final Rx<Agent?> selectedAgent = Rx<Agent?>(null);

  // إحداثيات الرياض كبداية
  static const initialCameraPosition = CameraPosition(
    target: LatLng(24.7136, 46.6753),
    zoom: 11.5,
  );

  @override
  void onInit() {
    super.onInit();
    _loadAgents(); // تحميل بيانات الوكلاء عند بدء تشغيل المتحكم
  }

  // دالة لتحميل بيانات الوكلاء (في تطبيق حقيقي، ستكون من API)
  void _loadAgents() {
    // بيانات وهمية للتجربة
    agents.assignAll([
      Agent(
        id: '1',
        name: 'عبد العزيز بن وليد',
        address: 'شارع عزيز، الطابق ٢٩، برج العليا',
        position: const LatLng(24.7136, 46.6753),
      ),
      Agent(
        id: '2',
        name: 'محمد الفهد',
        address: 'حي السليمانية، شارع التحلية',
        position: const LatLng(24.7034, 46.6862),
      ),
      Agent(
        id: '3',
        name: 'سارة عبد الله',
        address: 'جامعة الملك سعود، مبنى 5',
        position: const LatLng(24.7247, 46.6231),
      ),
      Agent(
        id: '4',
        name: 'خالد الغامدي',
        address: 'حي الملقا، طريق أنس بن مالك',
        position: const LatLng(24.7742, 46.6239),
      ),
    ]);
  }

  // دالة لاختيار وكيل وتحديث الحالة
  void selectAgent(Agent agent) {
    selectedAgent.value = agent;
    update(); // لإعلام الواجهة بالتغييرات
  }

  // دالة لإلغاء اختيار الوكيل
  void clearSelection() {
    selectedAgent.value = null;
    update();
  }

  // دالة لإنشاء علامات الخريطة بناءً على قائمة الوكلاء
  Set<Marker> createMarkers() {
    return agents.map((agent) {
      return Marker(
        markerId: MarkerId(agent.id),
        position: agent.position,
        infoWindow: InfoWindow(title: agent.name),
        onTap: () => selectAgent(agent),
      );
    }).toSet();
  }
}
