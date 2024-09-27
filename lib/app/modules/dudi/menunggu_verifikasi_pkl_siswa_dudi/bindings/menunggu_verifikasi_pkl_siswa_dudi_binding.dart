import 'package:get/get.dart';

import '../controllers/menunggu_verifikasi_pkl_siswa_dudi_controller.dart';

class MenungguVerifikasiPklSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenungguVerifikasiPklSiswaDudiController>(
      () => MenungguVerifikasiPklSiswaDudiController(),
    );
  }
}
