import 'package:get/get.dart';

import '../controllers/detil_siswa_guru_controller.dart';

class DetilSiswaGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilSiswaGuruController>(
      () => DetilSiswaGuruController(),
    );
  }
}
