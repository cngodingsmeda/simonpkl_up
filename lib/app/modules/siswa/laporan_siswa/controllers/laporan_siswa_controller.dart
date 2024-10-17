// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_harian_siswa_model.dart';
import 'package:simon_pkl/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_kendala_siswa/controllers/laporan_kendala_siswa_controller.dart';

class LaporanSiswaController extends GetxController {
  static var isKendala = false.obs;
  var laporanHarian = Rxn<LaporanHarianSiswa>();
  var token = AllMaterial.box.read("token");

  Future<void> getAllLaporanHarianSiswa() async {
    print("dijalankan");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllLaporanHarianSiswa),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        laporanHarian.value = LaporanHarianSiswa.fromJson(data);
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
        Uri.parse("${ApiUrl.urlGetAllLaporanHarianSiswa}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        Get.back();
        if (LaporanSiswaController.isKendala.isFalse) {
          final c = Get.put(LaporanSiswaController());
          c.getAllLaporanHarianSiswa();
        } else {
          final c = Get.put(LaporanKendalaSiswaController());
          c.getAllLaporanKendalaSiswa();
        }
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama("Laporan berhasil dihapus!"),
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

  Future<void> getLaporanHarianByIdSiswa(int id) async {
    print("by id dijalankan");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllLaporanHarianSiswa}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        Get.to(() => const DetilLaporanSiswaView(), arguments: data);
        update();
      } else {
        print("Failed to load report");
      }
    } catch (e) {
      print("Exception occurred while fetching report: $e");
    }
  }
}
