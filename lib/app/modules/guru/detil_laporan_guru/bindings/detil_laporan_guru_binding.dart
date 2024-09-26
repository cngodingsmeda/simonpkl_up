import 'package:get/get.dart';

import '../controllers/detil_laporan_guru_controller.dart';

class DetilLaporanGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilLaporanGuruController>(
      () => DetilLaporanGuruController(),
    );
  }
}
