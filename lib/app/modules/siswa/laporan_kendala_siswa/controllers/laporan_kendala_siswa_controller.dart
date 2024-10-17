// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_kendala_siswa_model.dart';
import 'package:simon_pkl/app/modules/siswa/detil_laporan_siswa/views/detil_laporan_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_siswa/controllers/laporan_siswa_controller.dart';

class LaporanKendalaSiswaController extends GetxController {
  var laporanKendala = Rxn<LaporanKendalaSiswaModel>();
  var token = AllMaterial.box.read("token");

  Future<void> getAllLaporanKendalaSiswa() async {
    print("dijalankan");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllLaporanKendalaSiswa),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        laporanKendala.value = LaporanKendalaSiswaModel.fromJson(data);
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
        Uri.parse(
            "${(LaporanSiswaController.isKendala.isTrue) ? ApiUrl.urlGetAllLaporanKendalaSiswa : ApiUrl.urlGetAllLaporanHarianSiswa}/$id"),
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

  Future<void> getLaporanKendalaByIdSiswa(int id) async {
    print("by id dijalankan");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllLaporanKendalaSiswa}/$id"),
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
