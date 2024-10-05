import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_siswa_model.dart';

class HistoriAbsenSiswaControllr extends GetxController {
  var selectedMonth = 7.obs;
  var historiAbsen = <Map<String, dynamic>>[].obs;

  final allHistoriAbsen = {
    7: [
      {
        "tanggal": "Jumat, 23 Juli 2024",
        "status": "Hadir",
        "icon": Icons.check_circle,
        "color": Colors.green
      },
      {
        "tanggal": "Kamis, 22 Juli 2024",
        "status": "Sakit",
        "icon": Icons.cancel,
        "color": Colors.red
      },
    ],
    8: [
      {
        "tanggal": "Sabtu, 24 Agustus 2024",
        "status": "Sakit",
        "icon": Icons.cancel,
        "color": Colors.red
      },
      {
        "tanggal": "Jumat, 23 Agustus 2024",
        "status": "Hadir",
        "icon": Icons.check_circle,
        "color": Colors.green
      },
      {
        "tanggal": "Kamis, 22 Agustus 2024",
        "status": "Hadir",
        "icon": Icons.check_circle,
        "color": Colors.green
      },
    ],
  };

  void updateHistoriAbsen(int month) {
    selectedMonth.value = month;
    historiAbsen.value = allHistoriAbsen[month] ?? [];
  }

  // with api
  var historiAbsenM = RxList<HistoriAbsenSiswa>();

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    // fetchHistoriAbsen();
  }
}
