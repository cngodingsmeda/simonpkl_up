import 'package:get/get.dart';

import '../controllers/home_dudi_controller.dart';

class HomeDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDudiController>(
      () => HomeDudiController(),
    );
  }
}
