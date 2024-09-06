import 'package:get/get.dart';

import '../controllers/profile_siswa_controller.dart';

class ProfileSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileSiswaController>(
      () => ProfileSiswaController(),
    );
  }
}
