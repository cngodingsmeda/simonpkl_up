import 'package:get/get.dart';

import '../controllers/detil_notifikasi_siswa_controller.dart';

class DetilNotifikasiSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilNotifikasiSiswaController>(
      () => DetilNotifikasiSiswaController(),
    );
  }
}
