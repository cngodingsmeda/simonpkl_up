import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/controllers/histori_absen_siswa_controller.dart';


class HistoriAbsenSiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriAbsenSiswaControllr>(
      () => HistoriAbsenSiswaControllr(),
    );
  }
}
