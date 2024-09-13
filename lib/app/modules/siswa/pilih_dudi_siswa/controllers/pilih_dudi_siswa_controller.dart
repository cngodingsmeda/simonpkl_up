import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/pilih_dudi_model.dart';
import 'package:simon_pkl/app/services/service_siswa/pilih_dudi_siswa_service.dart';

class PilihDudiSiswaController extends GetxController {
  var intPage = 0.obs;

  var dudiList = <PilihDudiModel>[].obs;
  var du = [2,5];
  var isLoading = true.obs;

  final PilihDudiSiswaService _pilihDudiService = PilihDudiSiswaService();

  @override
  void onInit() {
    // fetchDudiList();
    super.onInit();
  }

  void fetchDudiList() async {
    try {
      isLoading(true);
      var dudiData = await _pilihDudiService.fetchDudiList();
      dudiList.assignAll(dudiData);
    } catch (e) {
      print("Error fetching DUDI data: $e");
    } finally {
      isLoading(false);
    }
  }

  void changePage(int index) {
    intPage.value = index;
  }
}
