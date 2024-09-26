import 'package:get/get.dart';

import '../controllers/laporan_absen_siswa_guru_controller.dart';

class LaporanAbsenSiswaGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanAbsenSiswaGuruController>(
      () => LaporanAbsenSiswaGuruController(),
    );
  }
}
