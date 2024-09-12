import 'package:get/get.dart';

import '../controllers/absen_abnormal_siswa_controller.dart';

class AbsenAbnormalSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbsenAbnormalSiswaController>(
      () => AbsenAbnormalSiswaController(),
    );
  }
}
