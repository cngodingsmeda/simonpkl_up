import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/detil_laporan_harian_siswa_model.dart';
import 'package:simon_pkl/app/model/model_siswa/detil_laporan_kendala_siswa_model.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_siswa/controllers/laporan_siswa_controller.dart';

class DetilLaporanSiswaControllr extends GetxController {
  var laporan = Rx<DetilLaporanHarianSiswa?>(null);
  var kendala = Rx<DetilLaporanKendalaSiswaModel?>(null);

  @override
  void onInit() {
    var arg = Get.arguments;
    if (LaporanSiswaController.isKendala.isTrue) {
      kendala.value = DetilLaporanKendalaSiswaModel.fromJson(arg["data"]);
    } else {
      laporan.value = DetilLaporanHarianSiswa.fromJson(arg["data"]);
    }
    super.onInit();
  }
}
