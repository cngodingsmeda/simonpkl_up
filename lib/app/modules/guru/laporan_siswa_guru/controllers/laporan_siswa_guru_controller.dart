import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/model/model_guru/histori_all_kendala_dudi_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_kendala_siswa_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_laporan_dudi_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/histori_all_laporan_siswa_guru_model.dart';

class LaporanSiswaGuruController extends GetxController {
  var token = AllMaterial.box.read("token");
  var arg = Get.arguments;
  var historiAllKendalaSiswaGuru = Rx<HistoriAllKendalaSiswaGuruModel?>(null);
  var historiAllLaporanHarianSiswaGuru =
      Rx<HistoriAllLaporanHarianSiswaGuruModel?>(null);
  var historiAllLaporanHarianDudiGuru =
      Rx<HistoriAllLaporanDudiGuruModel?>(null);
  var historiAllKendalaDudiGuru = Rx<HistoriAllKendalaDudiGuruModel?>(null);

  Future<void> getAllLaporanSiswa(bool isKendala) async {
    String role = arg;
    try {
      final response = await http.get(
        Uri.parse(
          (role.toLowerCase().contains("siswa"))
              ? (isKendala)
                  ? ApiUrl.urlGetAllKendalaSiswaGuru
                  : ApiUrl.urlGetAllLaporanHarianSiswaGuru
              : (isKendala)
                  ? ApiUrl.urlGetAllKendalaDudiGuru
                  : ApiUrl.urlGetAllLaporanHarianDudiGuru,
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        if (isKendala == true) {
          historiAllKendalaSiswaGuru.value =
              historiAllKendalaSiswaGuruModelFromJson(response.body);
        } else {
          historiAllLaporanHarianSiswaGuru.value =
              historiAllLaporanHarianSiswaGuruModelFromJson(response.body);
        }
        print("Data berhasil dimuat");
        update();
      } else {
        print("Gagal memuat data: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> getAllLaporanDudi(bool isKendala) async {
    try {
      final response = await http.get(
        Uri.parse(
          (isKendala == true)
              ? ApiUrl.urlGetAllKendalaDudiGuru
              : ApiUrl.urlGetAllLaporanHarianDudiGuru,
        ),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        if (isKendala == true) {
          historiAllKendalaDudiGuru.value =
              historiAllKendalaDudiGuruModelFromJson(response.body);
        } else {
          historiAllLaporanHarianDudiGuru.value =
              historiAllLaporanDudiGuruModelFromJson(response.body);
        }
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
    bool isKendala = AllMaterial.box.read("isKendala");
    String role = arg;
    if (role.toLowerCase().contains("siswa")) {
      getAllLaporanSiswa(isKendala);
    } else {
      getAllLaporanDudi(isKendala);
    }
    super.onInit();
  }
}
