import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/ajuan_siswa_model.dart';
import 'package:simon_pkl/app/services/service_siswa/ajuan_siswa_service.dart';

class AjuanSiswaController extends GetxController {
  var ajuan = AjuanSiswa(
    status: '',
    instansiNama: '',
    batasVerifikasi: '',
    noTeleponInstansi: '',
    alamatInstansi: '',
  ).obs;
  var isLoading = true.obs;

  final AjuanSiswaService ajuanSiswaService = AjuanSiswaService();

  @override
  void onInit() {
    fetchAjuanData();
    super.onInit();
  }

  void fetchAjuanData() async {
    try {
      isLoading(true);
      var ajuanResponse = await ajuanSiswaService.getAjuanData();
      ajuan.value = ajuanResponse;
    } finally {
      isLoading(false);
    }
  }
}
