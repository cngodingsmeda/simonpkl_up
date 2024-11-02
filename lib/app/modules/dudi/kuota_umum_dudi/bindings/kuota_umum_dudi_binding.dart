import 'package:get/get.dart';

import '../controllers/kuota_umum_dudi_controller.dart';

class KuotaUmumDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KuotaUmumDudiController>(
      () => KuotaUmumDudiController(),
    );
  }
}
