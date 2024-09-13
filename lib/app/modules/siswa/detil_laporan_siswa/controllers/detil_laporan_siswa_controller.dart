import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_detil_siswa_model.dart';
import 'package:simon_pkl/app/services/service_siswa/laporan_detil_siswa_service.dart';

class DetilLaporanSiswaController extends GetxController {
   var laporanDetail = Rxn<LaporanDetilSiswa>();

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    // final String laporanId = Get.arguments;
    // fetchLaporanDetail(laporanId);
  }

  Future<void> fetchLaporanDetail(String id) async {
    try {
      laporanDetail.value = await LaporanDetilSiswaService.fetchLaporanDetailSiswa(id);
    } catch (e) {
      print("Error fetching laporan detail: $e");
    }
  }
}
