import 'package:get/get.dart';

import '../controllers/detil_histori_absen_siswa_dudi_controller.dart';

class DetilHistoriAbsenSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilHistoriAbsenSiswaDudiController>(
      () => DetilHistoriAbsenSiswaDudiController(),
    );
  }
}
