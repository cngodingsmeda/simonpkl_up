import 'package:get/get.dart';

import '../controllers/pilih_dudi_siswa_controller.dart';

class PilihDudiSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihDudiSiswaController>(
      () => PilihDudiSiswaController(),
    );
  }
}
