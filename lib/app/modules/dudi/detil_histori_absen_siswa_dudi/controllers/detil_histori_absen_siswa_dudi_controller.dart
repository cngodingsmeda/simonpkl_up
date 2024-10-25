import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/detil_histori_absen_siswa_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/detil_histori_absen_siswa_dudi/views/detil_histori_absen_siswa_dudi_view.dart';

class DetilHistoriAbsenSiswaDudiController extends GetxController {
  var isLoading = true.obs;
  var buktiDokumen = Rx<File?>(null);
  var detilAbsen = Rx<DetilHistoriAbsenSiswaDudiModel?>(null);
  var token = AllMaterial.box.read("token");

  Future<void> openFile(String url, File file) async {
    String fileExtension = url.split('.').last.toLowerCase();
    if (fileExtension == 'pdf' ||
        fileExtension == 'doc' ||
        fileExtension == 'docx') {
      await OpenFile.open(file.path);
    } else if (['jpg', 'jpeg', 'png'].contains(fileExtension)) {
      Get.dialog(
        Dialog(
          child: Image.file(file),
        ),
      );
    } else {
      Get.snackbar('Error', 'Unsupported file type');
    }
  }

  Future<void> getDetilAbsenById(
      int id, String jenisAbsen, String statusAbsen, String nama) async {
    print("id absen: $id");
    try {
      final response = await http.get(
        Uri.parse("${ApiUrl.urlGetAllHistoriAbsenSiswaByIdMonthDudi}/$id"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        isLoading.value = false;

        if (response.body.isNotEmpty) {
          var data = jsonDecode(response.body);
          if (data != null &&
              data.containsKey('data') &&
              data['data'] != null) {
            print("masuk ke data contains key data");
            var absensi = DetilHistoriAbsenSiswaDudiModel.fromJson(data);
            detilAbsen.value = absensi;
            if (detilAbsen.value != null) {
              isLoading.value = false;
            }
            Get.back();
            Get.to(() => const DetilHistoriAbsenSiswaDudiView(), arguments: {
              "jenis": jenisAbsen,
              "status": statusAbsen,
              "nama": nama
            });
            update();
          } else {
            print('Error: "data" key not found or null in the response');
            throw Exception(
                'Invalid response format: "data" key not found or null');
          }
        } else {
          print('Error: Response body is empty');
          throw Exception('Response body is empty');
        }
      } else {
        print("Failed to get data, status code: ${response.statusCode}");
        throw Exception('Failed to get data');
      }
    } catch (e) {
      print("Exception caught: $e");
      throw Exception(e.toString());
    }
  }

  String getTextStatus(String arg) {
    var absensi = detilAbsen.value;

    String? statusIzinMasuk = absensi?.data?.keteranganAbsenMasuk?.statusIzin;
    String? statusIzinPulang = absensi?.data?.keteranganAbsenPulang?.statusIzin;

    if (arg.contains("pulang")) {
      if (statusIzinPulang == null) {
        return "Tepat Waktu";
      } else if (statusIzinPulang.contains("radius")) {
        return "Telat";
      }
      return AllMaterial.setiapHurufPertama(statusIzinPulang);
    } else {
      if (statusIzinMasuk == null) {
        return "Tepat Waktu";
      }
      return AllMaterial.setiapHurufPertama(statusIzinMasuk);
    }
  }

  String getTextRadiusStatus(arg) {
    bool isMasuk = arg?.toString().contains("masuk") ?? false;

    var absensi = detilAbsen.value;
    print(absensi?.data?.keteranganAbsenPulang?.insideRadius);
    if (isMasuk) {
      return absensi?.data?.keteranganAbsenMasuk?.insideRadius ?? false
          ? "Di dalam radius"
          : "Di luar radius";
    } else {
      return absensi?.data?.keteranganAbsenPulang?.insideRadius ?? false
          ? "Di dalam radius"
          : "Di luar radius";
    }
  }
}
