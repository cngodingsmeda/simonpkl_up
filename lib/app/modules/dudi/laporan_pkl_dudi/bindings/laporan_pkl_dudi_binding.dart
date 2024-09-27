import 'package:get/get.dart';

import '../controllers/laporan_pkl_dudi_controller.dart';

class LaporanPklDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanPklDudiController>(
      () => LaporanPklDudiController(),
    );
  }
}
