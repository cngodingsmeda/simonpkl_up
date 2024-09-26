import 'package:get/get.dart';

import '../controllers/siswa_bimbingan_guru_controller.dart';

class SiswaBimbinganGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SiswaBimbinganGuruController>(
      () => SiswaBimbinganGuruController(),
    );
  }
}
