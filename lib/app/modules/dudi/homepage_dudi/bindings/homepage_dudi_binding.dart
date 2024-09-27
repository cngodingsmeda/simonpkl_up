import 'package:get/get.dart';

import '../controllers/homepage_dudi_controller.dart';

class HomepageDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageDudiController>(
      () => HomepageDudiController(),
    );
  }
}
