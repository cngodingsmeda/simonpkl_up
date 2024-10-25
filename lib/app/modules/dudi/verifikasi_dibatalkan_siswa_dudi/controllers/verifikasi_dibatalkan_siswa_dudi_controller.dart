import 'dart:convert';

import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/app/model/model_dudi/detil_ajuan_siswa_dudi_model.dart';

class VerifikasiDibatalkanSiswaDudiController extends GetxController {
  var token = AllMaterial.box.read("token");
  var detilAjuan = Rx<DetilAjuanSiswaDudiModel?>(null);

  Future<void> getAjuanById(int id) async {
    final response = await http.get(
      Uri.parse("${ApiUrl.urlGetAllPengajuanPKLDudi}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data);
      var pengajuan = DetilAjuanSiswaDudiModel.fromJson(data);
      detilAjuan.value = pengajuan;
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  @override
  void onInit() {
    var arg = Get.arguments;
    getAjuanById(arg["id"]);
    super.onInit();
  }
}
