import 'package:get/get.dart';

import '../controllers/buat_laporan_siswa_controller.dart';

class BuatLaporanSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatLaporanSiswaController>(
      () => BuatLaporanSiswaController(),
    );
  }
}
