import 'dart:convert';

import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_guru/detil_kendala_siswa_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/detil_laporan_siswa_guru_model.dart';
import 'package:http/http.dart' as http;

class DetilLaporanSiswaGuruController extends GetxController {
  static var isKendalaSiswa = false.obs;

  var arg = Get.arguments;
  var token = AllMaterial.box.read("token");
  var laporan = Rx<DetilLaporanSiswaGuruModel?>(null);
  var kendala = Rx<DetilKendalaSiswaGuruModel?>(null);

  Future<void> getLaporanById() async {
    final response = await http.get(
      Uri.parse(
        DetilLaporanSiswaGuruController.isKendalaSiswa.isTrue
            ? "${ApiUrl.urlGetAllKendalaSiswaGuru}/${arg["id"]}"
            : "${ApiUrl.urlGetAllLaporanHarianSiswaGuru}/${arg["id"]}",
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print("id laporan: ${arg["id"]}");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data);
      if (DetilLaporanSiswaGuruController.isKendalaSiswa.isTrue) {
        kendala.value = DetilKendalaSiswaGuruModel.fromJson(data);
      } else {
        laporan.value = DetilLaporanSiswaGuruModel.fromJson(data);
      }
      update();
    } else {
      print("gagal mengambil data");
      throw Exception('Failed to get data');
    }
  }

  @override
  void onInit() {
    getLaporanById();
    super.onInit();
  }
}
