import 'package:get/get.dart';

import '../controllers/detil_laporan_dudi_guru_controller.dart';

class DetilLaporanDudiGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilLaporanDudiGuruController>(
      () => DetilLaporanDudiGuruController(),
    );
  }
}
