import 'package:get/get.dart';

import '../controllers/detil_laporan_pkl_dudi_controller.dart';

class DetilLaporanPklDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilLaporanPklDudiController>(
      () => DetilLaporanPklDudiController(),
    );
  }
}
