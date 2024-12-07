import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/laporan_kendala_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/detil_laporan_pkl_dudi/views/detil_laporan_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/controllers/laporan_pkl_dudi_controller.dart';

class LaporanKendalaDudiController extends GetxController {
  var laporanKendala = Rxn<LaporanKendalaDudiModel>();
  var token = AllMaterial.box.read("token");

  Future<void> getAllLaporanKendalaDudi() async {
    print("dijalankan");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllLaporanKendalaDudi),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        laporanKendala.value = LaporanKendalaDudiModel.fromJson(data);
        update();
      } else {
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  Future<void> deleteLaporanDudi(int id, BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse(
            "${(LaporanPklDudiController.isKendala.isTrue) ? ApiUrl.urlGetAllLaporanKendalaDudi : ApiUrl.urlGetAllLaporanHarianDudi}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        Get.back();
        if (LaporanPklDudiController.isKendala.isFalse) {
          final c = Get.put(LaporanPklDudiController());
          c.getAllLaporanHarianDudi();
        } else {
          getAllLaporanKendalaDudi();
        }
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama("Laporan berhasil dihapus!"),
        );
        update();
      } else {
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  Future<void> getLaporanKendalaByIdDudi(int id) async {
    print("by id dijalankan");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllLaporanKendalaDudi}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        Get.to(() => const DetilLaporanPklDudiView(), arguments: data);
        update();
      } else {
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }
}
