import 'package:get/get.dart';

import '../controllers/profile_dudi_controller.dart';

class ProfileDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDudiController>(
      () => ProfileDudiController(),
    );
  }
}
