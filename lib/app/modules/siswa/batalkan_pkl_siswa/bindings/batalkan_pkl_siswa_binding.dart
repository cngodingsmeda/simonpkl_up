import 'package:get/get.dart';

import '../controllers/batalkan_pkl_siswa_controller.dart';

class BatalkanPklSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BatalkanPklSiswaController>(
      () => BatalkanPklSiswaController(),
    );
  }
}
