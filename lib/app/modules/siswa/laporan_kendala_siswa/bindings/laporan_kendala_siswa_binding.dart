import 'package:get/get.dart';

import '../controllers/laporan_kendala_siswa_controller.dart';

class LaporanKendalaSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanKendalaSiswaController>(
      () => LaporanKendalaSiswaController(),
    );
  }
}
