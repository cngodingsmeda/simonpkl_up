import 'package:get/get.dart';

import '../controllers/buat_jadwal_absen_dudi_controller.dart';

class BuatJadwalAbsenDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatJadwalAbsenDudiController>(
      () => BuatJadwalAbsenDudiController(),
    );
  }
}
