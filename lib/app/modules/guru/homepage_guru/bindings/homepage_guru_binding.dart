import 'package:get/get.dart';

import '../controllers/homepage_guru_controller.dart';

class HomepageGuruBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageGuruController>(
      () => HomepageGuruController(),
    );
  }
}
