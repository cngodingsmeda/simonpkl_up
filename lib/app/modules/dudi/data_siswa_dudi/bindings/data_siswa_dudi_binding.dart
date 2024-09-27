import 'package:get/get.dart';

import '../controllers/data_siswa_dudi_controller.dart';

class DataSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataSiswaDudiController>(
      () => DataSiswaDudiController(),
    );
  }
}
