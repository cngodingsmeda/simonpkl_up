import 'package:get/get.dart';

import '../controllers/form_rekrut_siswa_dudi_controller.dart';

class FormRekrutSiswaDudiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormRekrutSiswaDudiController>(
      () => FormRekrutSiswaDudiController(),
    );
  }
}
