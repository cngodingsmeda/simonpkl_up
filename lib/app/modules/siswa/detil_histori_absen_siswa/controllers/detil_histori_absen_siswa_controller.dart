import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/detil_absen_siswa_model.dart';
import 'package:simon_pkl/app/modules/siswa/detil_histori_absen_siswa/views/detil_histori_absen_siswa_view.dart';

class DetilHistoriAbsenSiswaControllr extends GetxController {
  var buktiDokumenUrl = ''.obs;
  var isLoading = true.obs;
  var buktiDokumen = Rx<File?>(null);
  var detilAbsen = Rx<DetilHistoriAbsenModel?>(null);
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
      int id, String jenisAbsen, String statusAbsen) async {
    print("id absen: $id");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetHistoriAbsenDetilSiswa + id.toString()),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      // Log the response status and body for debugging
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
            var absensi = DetilHistoriAbsenModel.fromJson(data["data"]);
            detilAbsen.value = absensi;
            if (detilAbsen.value != null) {
              isLoading.value = false;
            }
            Get.back();
            Get.to(() => const DetilHistoriAbsenSiswaView(),
                arguments: {"jenis": jenisAbsen, "status": statusAbsen});
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

    // Retrieve statusIzin for masuk and pulang, default to null if not available.
    String? statusIzinMasuk = absensi?.keteranganAbsenMasuk?.statusIzin;
    String? statusIzinPulang = absensi?.keteranganAbsenPulang?.statusIzin;

    // Determine if it's absen pulang or masuk.
    if (arg.contains("pulang")) {
      if (statusIzinPulang == null) {
        return "Tepat Waktu";
      }
      // Handle statusIzin for pulang.
      else if (statusIzinPulang.contains("radius")) {
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
    print(absensi?.keteranganAbsenPulang?.insideRadius);
    if (isMasuk) {
      return absensi?.keteranganAbsenMasuk?.insideRadius ?? false
          ? "Di dalam radius"
          : "Di luar radius";
    } else {
      return absensi?.keteranganAbsenPulang?.insideRadius ?? false
          ? "Di dalam radius"
          : "Di luar radius";
    }
  }

  String getAbsenStatus(String jenisAbsen, String statusAbsen,
      {String? keteranganAbsen}) {
    switch (jenisAbsen) {
      case "masuk":
        switch (statusAbsen) {
          case "hadir":
            return "Hadir Masuk";
          case "telat":
            return "Telat Masuk";
          case "tidak_hadir":
            return "Tidak Hadir Masuk";
          case "izin":
            if (keteranganAbsen == "diluar_radius") {
              return "Izin Masuk (Di Luar Radius)";
            }
            return "Izin Masuk";
          case "sakit":
            return "Sakit Masuk";
          default:
            return "Tidak ada absen masuk";
        }
      case "pulang":
        switch (statusAbsen) {
          case "hadir":
            return "Hadir Pulang";
          case "telat":
            return "Telat Pulang";
          case "tidak_hadir":
            return "Tidak Hadir Pulang";
          case "izin":
            if (keteranganAbsen == "diluar_radius") {
              return "Izin Pulang (Di Luar Radius)";
            }
            return "Izin Pulang";
          case "sakit":
            return "Sakit Pulang";
          default:
            return "Tidak ada absen pulang";
        }
      default:
        return "Jenis Absen Tidak Diketahui";
    }
  }
}
