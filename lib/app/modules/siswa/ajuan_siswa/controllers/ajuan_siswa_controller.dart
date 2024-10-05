import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/ajuan_pkl_by_id_model.dart';

class AjuanSiswaController extends GetxController {
  var token = AllMaterial.box.read("token");
  var ajuanPklById = Rx<AjuanPklByIdModel?>(null);

  Future<void> getAjuanPklById(int id) async {
    final response = await http.get(
      Uri.parse(ApiUrl.urlGetPengajuanByIdSiswa + id.toString()),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("ajuan by id: $data");
      var ajuanPkl = AjuanPklByIdModel.fromJson(data["data"]);
      ajuanPklById.value = ajuanPkl;
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }
}
