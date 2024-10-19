import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_guru/histori_absen_siswa_guru_model.dart';

class HistoriAbsenSiswaGuruController extends GetxController {
  var selectedMonth = 6.obs;
  var token = AllMaterial.box.read("token");
  var historiAbsen = <Map<String, dynamic>>[].obs;
  var arg = Get.arguments;

  Color iconColor(String status) {
    if (status == "hadir") {
      return Colors.green;
    } else if (status.contains("tidak")) {
      return Colors.red;
    } else if (status.contains("sakit") || status.contains("izin")) {
      return Colors.yellow;
    } else {
      return Colors.blueAccent;
    }
  }

  IconData iconCard(String status) {
    if (status == "hadir") {
      return Icons.check_circle;
    } else if (status.contains("tidak")) {
      return Icons.cancel_sharp;
    } else if (status.contains("sakit") || status.contains("izin")) {
      return Icons.info_sharp;
    } else {
      return Icons.check_circle;
    }
  }

  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
  }

  var historiAbsenSiswaGuru = Rx<HistoriAbsenSiswaGuruModel?>(null);

  Future<void> fetchHistoriAbsen() async {
    try {
      final response = await http.get(
        Uri.parse(
            "${ApiUrl.urlGetAllHistoriAbsenSiswaByIdMonth}?month=${selectedMonth.value}&id_siswa=${arg["id"]}"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
      if (response.statusCode == 200) {
        historiAbsenSiswaGuru.value =
            historiAbsenSiswaGuruModelFromJson(response.body);
        print("Data berhasil dimuat");
        update();
      } else {
        print("Gagal memuat data: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void onInit() {
    var bulan = DateTime.now().month;
    selectedMonth.value = bulan;
    fetchHistoriAbsen();
    super.onInit();
  }
}
