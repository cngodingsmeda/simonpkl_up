import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/daftar_koordinat_absen_dudi_model.dart';

class DaftarLokasiAbsenDudiController extends GetxController {
  var lokasiAbsen = Rx<DaftarKoordinatAbsenDudiModel?>(null);
  var token = AllMaterial.box.read("token");

  Future<void> getAllLokasiAbsen() async {
    print("dijalankan");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlPostKoordinatAbsen),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("getAllLokasiAbsen: $data");
        lokasiAbsen.value = DaftarKoordinatAbsenDudiModel.fromJson(data);
        update();
      } else {
        print(data);
        print("gagal menampilkan data");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  Future<void> deleteKoordinatAbsen(int id, BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse("${ApiUrl.urlPostKoordinatAbsen}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        Get.back();
        getAllLokasiAbsen();
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama("Lokasi berhasil dihapus!"),
          context: context,
        );
        update();
      } else {
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  @override
  void onInit() {
    getAllLokasiAbsen();
    super.onInit();
  }
}
