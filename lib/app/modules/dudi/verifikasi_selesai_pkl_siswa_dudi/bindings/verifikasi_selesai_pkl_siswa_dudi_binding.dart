import 'package:get/get.dart';

import '../controllers/verifikasi_selesai_pkl_siswa_dudi_controller.dart';

class VerifikasiSelesaiPklSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiSelesaiPklSiswaDudiController>(
      () => VerifikasiSelesaiPklSiswaDudiController(),
    );
  }
}
