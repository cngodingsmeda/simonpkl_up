import 'package:get/get.dart';

import '../controllers/lokasi_absen_dudi_controller.dart';

class LokasiAbsenDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LokasiAbsenDudiController>(
      () => LokasiAbsenDudiController(),
    );
  }
}
