// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/detil_ajuan_siswa_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/data_siswa_dudi/controllers/data_siswa_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/homepage_dudi/controllers/homepage_dudi_controller.dart';

class MenungguVerifikasiPklSiswaDudiController extends GetxController {
  var token = AllMaterial.box.read("token");
  var detilAjuan = Rx<DetilAjuanSiswaDudiModel?>(null);
  var arg = Get.arguments;

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

  Future<void> putAccDccAjuanPKL(
      int id, bool setuju, BuildContext context) async {
    final response = await http.put(
      Uri.parse("${ApiUrl.urlGetAllPengajuanPKLDudi}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "status": setuju ? "setuju" : "tidak_setuju",
        },
      ),
    );
    var data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data);
      Get.back();
      Get.back();
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama(
            "Ajuan telah di${setuju ? "terima" : "tolak"}"),
      );
      final homeC = Get.put(HomepageDudiController());
      final siswaC = Get.put(DataSiswaDudiController());
      homeC.getAllPengajuanPKL();
      homeC.getCountSiswaDudi();
      siswaC.getAllSiswa();
      update();
    } else {
      print(data);
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Terjadi kesalahan, coba lagi nanti"),
      );
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  @override
  void onInit() {
    getAjuanById(arg["id"]);
    super.onInit();
  }
}
