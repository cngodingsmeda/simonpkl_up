import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/controllers/detil_histori_absen_siswa_controller.dart';


class DetilHistoriAbsenSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetilHistoriAbsenSiswaControllr>(
      () => DetilHistoriAbsenSiswaControllr(),
    );
  }
}
