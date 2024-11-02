import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/all_jurusan_dudi_model.dart';
import 'package:simon_pkl/app/model/model_dudi/kuota_pkl_siswa_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/buat_form_pkl_dudi/controllers/buat_form_pkl_dudi_controller.dart';

class FormRekrutSiswaDudiController extends GetxController {
  var kuotaDudi = Rx<KuotaDudiModel?>(null);
  var token = AllMaterial.box.read("token");

  Future<void> getAllKuotaSiswaDudi() async {
    print("dijalankan");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetKuotaSiswaDudi),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("getAllKuotaSiswaDudi: $data");
        kuotaDudi.value = KuotaDudiModel.fromJson(data);
        update();
      } else {
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  Future<void> getAllJurusanDudi() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllJurusanDudi),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

        var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
        var siswa = AllJurusanDudiModel.fromJson(data);
        BuatFormPklDudiController.jurusan.value = siswa;

        update();
      } else {
        print("getAllJurusanDudi: $data");
        print("Failed to load data");
      }
    } catch (e) {
      print("Exception occurred while fetching data: $e");
    }
  }

  @override
  void onInit() {
    getAllKuotaSiswaDudi();
    getAllJurusanDudi();
    super.onInit();
  }
}
