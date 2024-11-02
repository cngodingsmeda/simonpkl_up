import 'package:get/get.dart';

import '../controllers/daftar_lokasi_absen_dudi_controller.dart';

class DaftarLokasiAbsenDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarLokasiAbsenDudiController>(
      () => DaftarLokasiAbsenDudiController(),
    );
  }
}
