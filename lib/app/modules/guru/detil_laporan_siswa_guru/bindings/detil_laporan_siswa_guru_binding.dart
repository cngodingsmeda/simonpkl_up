import 'package:get/get.dart';

import '../controllers/detil_laporan_siswa_guru_controller.dart';

class DetilLaporanSiswaGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilLaporanSiswaGuruController>(
      () => DetilLaporanSiswaGuruController(),
    );
  }
}
