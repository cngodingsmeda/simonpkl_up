import 'package:get/get.dart';

import '../controllers/detil_notifikasi_guru_controller.dart';

class DetilNotifikasiGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilNotifikasiGuruController>(
      () => DetilNotifikasiGuruController(),
    );
  }
}
