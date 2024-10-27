import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_dudi/detil_laporan_harian_dudi_model.dart';
import 'package:simon_pkl/app/model/model_dudi/detil_laporan_kendala_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/controllers/laporan_pkl_dudi_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DetilLaporanPklDudiController extends GetxController {
  var laporan = Rx<DetilLaporanHarianDudiModel?>(null);
  var kendala = Rx<DetilLaporanKendalaDudiModel?>(null);


  Future<void> bukaWhatsApp(String nomor) async {
    final Uri waUrl = Uri.parse("https://wa.me/$nomor");
    if (await canLaunchUrl(waUrl)) {
      await launchUrl(waUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }

  @override
  void onInit() {
    var arg = Get.arguments;
    if (LaporanPklDudiController.isKendala.isTrue) {
      kendala.value = DetilLaporanKendalaDudiModel.fromJson(arg);
    } else {
      laporan.value = DetilLaporanHarianDudiModel.fromJson(arg);
    }
    super.onInit();
  }
  
}
