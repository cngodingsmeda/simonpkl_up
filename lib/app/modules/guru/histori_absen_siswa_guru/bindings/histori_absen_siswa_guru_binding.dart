import 'package:get/get.dart';

import '../controllers/histori_absen_siswa_guru_controller.dart';

class HistoriAbsenSiswaGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriAbsenSiswaGuruController>(
      () => HistoriAbsenSiswaGuruController(),
    );
  }
}
