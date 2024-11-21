// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/laporan_harian_pkl_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/detil_laporan_pkl_dudi/views/detil_laporan_pkl_dudi_view.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_kendala_dudi/controllers/laporan_kendala_dudi_controller.dart';

class LaporanPklDudiController extends GetxController {
  static var isKendala = false.obs;
  var laporanHarian = Rxn<LaporanHarianDudiModel>();
  var token = AllMaterial.box.read("token");

  Future<void> getAllLaporanHarianDudi() async {
    print("dijalankan");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllLaporanHarianDudi),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        laporanHarian.value = LaporanHarianDudiModel.fromJson(data);
        update();
      } else {
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }

  Future<void> deleteLaporanSiswa(int id, BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse("${ApiUrl.urlGetAllLaporanHarianDudi}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        Get.back();
        if (LaporanPklDudiController.isKendala.isFalse) {
          getAllLaporanHarianDudi();
        } else {
          final c = Get.put(LaporanKendalaDudiController());
          c.getAllLaporanKendalaDudi();
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

  Future<void> getLaporanHarianByIdDudi(int id) async {
    print("by id dijalankan");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllLaporanHarianDudi}/$id"),
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
