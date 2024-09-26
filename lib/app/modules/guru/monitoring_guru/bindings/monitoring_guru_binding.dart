import 'package:get/get.dart';

import '../controllers/monitoring_guru_controller.dart';

class MonitoringGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoringGuruController>(
      () => MonitoringGuruController(),
    );
  }
}
