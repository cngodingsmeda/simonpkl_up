import 'package:get/get.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/controllers/profile_siswa_controller.dart';

class HomeSiswaController extends GetxController {
  var indexPage = 0.obs;
  var keHistoriAbsen = false.obs;

  @override
  void onInit() {
    final profCont = Get.put(ProfileSiswaController());
    profCont.fetchProfilSiswa();
    indexPage.value = 0;
    update();
    super.onInit();
  }

  @override
  void onClose() {
    indexPage.value = 0;
    update();
    super.onClose();
  }
}
