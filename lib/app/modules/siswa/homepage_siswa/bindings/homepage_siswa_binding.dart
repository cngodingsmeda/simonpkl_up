import 'package:get/get.dart';

import '../controllers/homepage_siswa_controller.dart';

class HomepageSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageSiswaController>(
      () => HomepageSiswaController(),
    );
  }
}
