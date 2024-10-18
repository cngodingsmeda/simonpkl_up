import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/histori_absen_siswa_model.dart';

class HistoriAbsenSiswaControllr extends GetxController {
  var selectedMonth = 6.obs;
  var token = AllMaterial.box.read("token");
  var absen = <Datum>[].obs;

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
    fetchHistoriAbsenSiswa();
  }

  Future<void> fetchHistoriAbsenSiswa() async {
    final response = await http.get(
      Uri.parse(
          "${ApiUrl.urlGetHistoriAbsenByMonthSiswa}${selectedMonth.value}"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print("data absen month: $data");
      absen.clear();

      // Ensure `data["data"]` is a List
      if (data["data"] is List) {
        absen.value = List<Datum>.from(
          data["data"].map((item) => Datum.fromJson(item)),
        );
      } else {
        print("Unexpected data structure: ${data["data"]}");
        throw Exception('Invalid data format');
      }

      update();
    } else {
      print("gagal menampilkan data");
      throw Exception('Failed to load data');
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    var bulan = DateTime.now().month;
    selectedMonth.value = bulan;
    print(bulan);
  }
}
