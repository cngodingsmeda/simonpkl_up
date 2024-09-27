import 'package:get/get.dart';

import '../controllers/ajuan_pkl_siswa_dudi_controller.dart';

class AjuanPklSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AjuanPklSiswaDudiController>(
      () => AjuanPklSiswaDudiController(),
    );
  }
}
