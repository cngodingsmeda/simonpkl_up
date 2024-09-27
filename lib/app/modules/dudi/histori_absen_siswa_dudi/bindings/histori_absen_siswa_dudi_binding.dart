import 'package:get/get.dart';

import '../controllers/histori_absen_siswa_dudi_controller.dart';

class HistoriAbsenSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriAbsenSiswaDudiController>(
      () => HistoriAbsenSiswaDudiController(),
    );
  }
}
