import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaporanSiswaController extends GetxController {
  var selectedMonth = 7.obs;
  var laporan = <Map<String, dynamic>>[].obs;

  final allLaporan = {
    7: [
      {"tanggal": "Jumat, 23 Juli 2024", "status": "Hadir", "icon": Icons.check_circle, "color": Colors.green},
      {"tanggal": "Kamis, 22 Juli 2024", "status": "Sakit", "icon": Icons.cancel, "color": Colors.red},
    ],
    8: [
      {"tanggal": "Sabtu, 24 Agustus 2024", "status": "Sakit", "icon": Icons.cancel, "color": Colors.red},
      {"tanggal": "Jumat, 23 Agustus 2024", "status": "Hadir", "icon": Icons.check_circle, "color": Colors.green},
      {"tanggal": "Kamis, 22 Agustus 2024", "status": "Hadir", "icon": Icons.check_circle, "color": Colors.green},
    ],
  };

  void updateLaporan(int month) {
    selectedMonth.value = month;
    laporan.value = allLaporan[month] ?? [];
  }
}
