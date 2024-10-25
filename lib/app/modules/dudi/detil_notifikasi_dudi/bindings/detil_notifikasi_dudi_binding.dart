import 'package:get/get.dart';

import '../controllers/detil_notifikasi_dudi_controller.dart';

class DetilNotifikasiDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilNotifikasiDudiController>(
      () => DetilNotifikasiDudiController(),
    );
  }
}
