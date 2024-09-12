import 'package:get/get.dart';

import '../controllers/pilihan_absen_siswa_controller.dart';

class PilihanAbsenSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihanAbsenSiswaController>(
      () => PilihanAbsenSiswaController(),
    );
  }
}
