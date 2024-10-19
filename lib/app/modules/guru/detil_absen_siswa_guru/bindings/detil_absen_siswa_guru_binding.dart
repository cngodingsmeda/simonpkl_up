import 'package:get/get.dart';

import '../controllers/detil_absen_siswa_guru_controller.dart';

class DetilAbsenSiswaGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilAbsenSiswaGuruController>(
      () => DetilAbsenSiswaGuruController(),
    );
  }
}
