import 'package:get/get.dart';

import '../controllers/notifikasi_guru_controller.dart';

class NotifikasiGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiGuruController>(
      () => NotifikasiGuruController(),
    );
  }
}
