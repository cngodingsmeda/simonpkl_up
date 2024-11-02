import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/jadwal_absen_siswa_dudi_model.dart';

class JadwalAbsenSiswaDudiController extends GetxController {
  var jadwalAbsen = Rx<JadwalAbsenSiswaDudiModel?>(null);
  var token = AllMaterial.box.read("token");

  Future<void> getAllJadwalAbsen() async {
    print("dijalankan");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlJadwalAbsenDudi),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("getAllJadwalAbsen: $data");
        jadwalAbsen.value = JadwalAbsenSiswaDudiModel.fromJson(data);
        update();
      } else {
        print(data);
        print("gagal menampilkan data");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  Future<void> deleteJadwalAbsen(int id, BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse("${ApiUrl.urlJadwalAbsenDudi}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        getAllJadwalAbsen();
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama("Jadwal berhasil dihapus!"),
          context: context,
        );
        update();
      } else {
        print(response.body);
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  @override
  void onInit() {
    getAllJadwalAbsen();
    super.onInit();
  }
}
