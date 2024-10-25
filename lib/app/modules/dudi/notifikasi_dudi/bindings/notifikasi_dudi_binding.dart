import 'package:get/get.dart';

import '../controllers/notifikasi_dudi_controller.dart';

class NotifikasiDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiDudiController>(
      () => NotifikasiDudiController(),
    );
  }
}
