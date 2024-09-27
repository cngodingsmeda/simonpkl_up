import 'package:get/get.dart';

import '../controllers/skema_pkl_dudi_controller.dart';

class SkemaPklDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkemaPklDudiController>(
      () => SkemaPklDudiController(),
    );
  }
}
