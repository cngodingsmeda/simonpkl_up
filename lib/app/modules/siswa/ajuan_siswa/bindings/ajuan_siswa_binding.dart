import 'package:get/get.dart';

import '../controllers/ajuan_siswa_controller.dart';

class AjuanSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AjuanSiswaController>(
      () => AjuanSiswaController(),
    );
  }
}
