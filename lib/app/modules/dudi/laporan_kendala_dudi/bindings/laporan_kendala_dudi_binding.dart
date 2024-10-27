import 'package:get/get.dart';

import '../controllers/laporan_kendala_dudi_controller.dart';

class LaporanKendalaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanKendalaDudiController>(
      () => LaporanKendalaDudiController(),
    );
  }
}
