import 'package:get/get.dart';

import '../controllers/buat_laporan_pkl_dudi_controller.dart';

class BuatLaporanPklDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatLaporanPklDudiController>(
      () => BuatLaporanPklDudiController(),
    );
  }
}
