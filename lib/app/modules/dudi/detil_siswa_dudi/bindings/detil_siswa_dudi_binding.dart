import 'package:get/get.dart';

import '../controllers/detil_siswa_dudi_controller.dart';

class DetilSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilSiswaDudiController>(
      () => DetilSiswaDudiController(),
    );
  }
}
