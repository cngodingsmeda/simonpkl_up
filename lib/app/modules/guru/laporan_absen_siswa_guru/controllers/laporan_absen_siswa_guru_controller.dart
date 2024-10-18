import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_absen_siswa_guru_model.dart';

class LaporanAbsenSiswaGuruController extends GetxController {
  var selectedMonth = 6.obs;
  var token = AllMaterial.box.read("token");
  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
  }

  var historiAllAbsenSiswaGuru = Rx<HistoriAllAbsenSiswaGuruModel?>(null);

  Future<void> fetchHistoriAbsen() async {
    try {
      final response = await http.get(
        Uri.parse(
            "${ApiUrl.urlGetAllHistoriAbsenSiswaGuru}?month=${selectedMonth.value}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
      // var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        historiAllAbsenSiswaGuru.value =
            historiAllAbsenSiswaGuruModelFromJson(response.body);
        print("Data berhasil dimuat");
        update();
      } else {
        print("Gagal memuat data: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void onInit() {
    var bulan = DateTime.now().month;
    selectedMonth.value = bulan;
    fetchHistoriAbsen();
    super.onInit();
  }
}
