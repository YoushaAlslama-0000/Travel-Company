// ignore_for_file: library_private_types_in_public_api
import 'package:flight_app/common/custom_utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/agent_controller.dart';
import 'package:flight_app/features/main_feature/agent_feature/views/agent-model.dart';
// ملاحظة: قم باستيراد ملف الألوان الخاص بك
// import 'package:flight_app/common/custom_utiles/colors.dart';

// لون ذهبي مؤقت بديل
const goldColor = Color(0xFFC7A24F);

class AgentView extends StatelessWidget {
  const AgentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // استخدم Get.put() لإنشاء والبحث عن المتحكم
    final AgentViewController controller = Get.put(AgentViewController());

    return Scaffold(
      // backgroundColor: AppColors.blackColor, // استخدم لون الخلفية الخاص بك
      appBar: _buildAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Obx يعيد بناء الويدجت فقط عند تغيير قيمة المتغيرات بداخله
          Obx(
            () => GoogleMap(
              initialCameraPosition: AgentViewController.initialCameraPosition,
              markers: controller.createMarkers(),
              onTap: (_) => controller
                  .clearSelection(), // لإلغاء الاختيار عند الضغط على الخريطة
            ),
          ),

          // هذا الويدجت يراقب الوكيل المختار ويعرض البطاقة بحركة لطيفة
          Obx(() {
            final agent = controller.selectedAgent.value;
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              bottom: agent != null ? 16 : -250, // حرك البطاقة للأعلى أو أخفها
              left: 16,
              right: 16,
              child: _AgentInfoCard(agent: agent),
            );
          }),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 1,
      centerTitle: true,
      leading: const Icon(Icons.arrow_back, color: Colors.black),
      title: const Text(
        'وكيل',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _AgentInfoCard extends StatelessWidget {
  final Agent? agent;
  const _AgentInfoCard({Key? key, this.agent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // إذا لم يتم اختيار أي وكيل، يتم عرض حاوية فارغة
    if (agent == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // لجعل العمود يأخذ أقل مساحة ممكنة
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(agent!.avatarUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      agent!.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      agent!.distance,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  agent!.address,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.access_time_outlined,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(agent!.openUntil, style: const TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message_outlined,
                    color: AppColors.mainColor,
                  ),
                  label: const Text(
                    'رسالة',
                    style: TextStyle(color: AppColors.mainColor),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.mainColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call_outlined,
                    color: AppColors.whiteColor,
                  ),
                  label: const Text(
                    'اتصال',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
