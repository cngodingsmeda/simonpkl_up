import 'package:get/get.dart';

import '../controllers/buat_form_pkl_dudi_controller.dart';

class BuatFormPklDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuatFormPklDudiController>(
      () => BuatFormPklDudiController(),
    );
  }
}
