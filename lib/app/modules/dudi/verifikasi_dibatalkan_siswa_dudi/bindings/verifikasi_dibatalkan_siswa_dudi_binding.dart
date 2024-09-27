import 'package:get/get.dart';

import '../controllers/verifikasi_dibatalkan_siswa_dudi_controller.dart';

class VerifikasiDibatalkanSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiDibatalkanSiswaDudiController>(
      () => VerifikasiDibatalkanSiswaDudiController(),
    );
  }
}
