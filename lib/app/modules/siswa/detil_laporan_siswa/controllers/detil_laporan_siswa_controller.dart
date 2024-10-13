import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/detil_laporan_harian_siswa_model.dart';

class DetilLaporanSiswaControllr extends GetxController {
  var laporan = Rx<DetilLaporanHarianSiswa?>(null);

  @override
  void onInit() {
    var arg = Get.arguments;
    laporan.value = DetilLaporanHarianSiswa.fromJson(arg["data"]);
    super.onInit();
  }
}
