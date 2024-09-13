import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/notif_siswa_model.dart';
import 'package:simon_pkl/app/services/service_siswa/notif_siswa_service.dart';

class NotifikasiSiswaController extends GetxController {
  var notifikasiList = <NotifikasiModel>[].obs;
  var isLoading = true.obs;

  final NotifikasiSiswaService notifikasiService = NotifikasiSiswaService();

  @override
  void onInit() {
    // fetchNotifikasi();
    super.onInit();
  }

  void fetchNotifikasi() async {
    try {
      isLoading(true);
      var notifikasiResponse = await notifikasiService.getNotifikasiData();
      notifikasiList.value = notifikasiResponse;
    } finally {
      isLoading(false);
    }
  }
}
