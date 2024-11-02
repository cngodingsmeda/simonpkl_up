import 'package:get/get.dart';

import '../controllers/jadwal_absen_siswa_dudi_controller.dart';

class JadwalAbsenSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalAbsenSiswaDudiController>(
      () => JadwalAbsenSiswaDudiController(),
    );
  }
}
