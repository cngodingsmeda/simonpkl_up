import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/jadwal_absen_siswa.dart';

class PilihanAbsenSiswaController extends GetxController {
  var isWithinRadius = false.obs;
  var isLoading = false.obs;
 var jadwalAbsenSiswa = Rx<JadwalAbsenSiswa?>(null);

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    // checkLocation();
  }

}
