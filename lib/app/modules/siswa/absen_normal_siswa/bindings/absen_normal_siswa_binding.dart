import 'package:get/get.dart';

import '../controllers/absen_normal_siswa_controller.dart';

class AbsenNormalSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenNormalSiswaController>(
      () => AbsenNormalSiswaController(),
    );
  }
}
