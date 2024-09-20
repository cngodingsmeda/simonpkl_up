import 'package:get/get.dart';

import '../controllers/laporan_siswa_guru_controller.dart';

class LaporanSiswaGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanSiswaGuruController>(
      () => LaporanSiswaGuruController(),
    );
  }
}
