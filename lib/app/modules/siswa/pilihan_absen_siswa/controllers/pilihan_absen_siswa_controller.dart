import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/jadwal_absen_siswa.dart';
import 'package:simon_pkl/app/model/model_siswa/pilihan_absen_siswa.dart';
import 'package:simon_pkl/app/services/service_siswa/dalam_radius_service.dart';

class PilihanAbsenSiswaController extends GetxController {
  final PilihanAbsenService absenService = PilihanAbsenService();
  var isWithinRadius = false.obs;
  var isLoading = false.obs;
 var jadwalAbsenSiswa = Rx<JadwalAbsenSiswa?>(null);

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    // checkLocation();
  }

  void checkLocation() async {
    try {
      isLoading(true);
      var lokasi = PilihanAbsenSiswa(latitude: -6.9175, longitude: 107.6191, jenisAbsen: "Masuk");
      isWithinRadius.value = await absenService.diDalamRadius(lokasi);
    } finally {
      isLoading(false);
    }
  }
}
