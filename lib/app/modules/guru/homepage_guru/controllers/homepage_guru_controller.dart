import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_guru/dudi_terkait_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/siswa_bimbingan_guru_model.dart';

class HomepageGuruController extends GetxController {
  var readCount = 0.obs;
  var jumlahSiswa = 0.obs;
  var isCompleted = false.obs;
  var jumlahDudi = 0.obs;
  var jumlahKendalaSiswa = 0.obs;
  var dudiTerkait = Rxn<DudiTerkaitModel?>();
  var siswaBimbingan = Rxn<SiswaBimbinganModel?>();

  Future<void> getSiswaBimbingan() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetAllSiswaBimbinganGuru),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      siswaBimbingan.value = SiswaBimbinganModel.fromJson(data);
      jumlahSiswa.value = siswaBimbingan.value?.data?.length ?? 0;
      isCompleted.value = true;
      update();
    } else {
      isCompleted.value = false;
      print("Gagal mengirim data");
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> getKendalaSiswaCount() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetKendalaSiswaCountGuru),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      jumlahKendalaSiswa.value = data["data"]["count"] ?? 0;
      update();
    } else {
      print("Gagal mengirim data");
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> getDudiTerkait() async {
    print("dijalankan");
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetAllDudiTerkaitGuru),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      dudiTerkait.value = DudiTerkaitModel.fromJson(data);
      jumlahDudi.value = dudiTerkait.value?.data?.length ?? 0;
      update();
    } else {
      print("Gagal mengirim data");
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> getNotifUnreadGuru() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetNotifUnreadGuru),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      readCount.value = data["data"]["count"] ?? 0;
      update();
    } else {
      print("Gagal mengirim data");
      throw Exception('Failed to fetch data');
    }
  }

  @override
  void onClose() {
    readCount.value = 0;
    jumlahSiswa.value = 0;
    jumlahDudi.value = 0;
    jumlahKendalaSiswa.value = 0;
    super.onClose();
  }
}
