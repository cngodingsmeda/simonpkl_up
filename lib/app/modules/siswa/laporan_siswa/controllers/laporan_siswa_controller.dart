import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_siswa_model.dart';
import 'package:simon_pkl/app/services/service_siswa/laporan_siswa_service.dart';

class LaporanSiswaController extends GetxController {
  var selectedMonth = 7.obs;
  var laporan = <Map<String, dynamic>>[].obs;

  final allLaporan = {
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

  void updateLaporan(int month) {
    selectedMonth.value = month;
    laporan.value = allLaporan[month] ?? [];
  }

  // with api
  var laporanM = RxList<LaporanSiswa>();

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    // fetchLaporan(); 
  }

  Future<void> fetchLaporan({int? month}) async {
    try {
      laporanM.value = await LaporanSiswaService.fetchLaporanSiswa(month);
    } catch (e) {
      print("Error fetching laporan: $e");
    }
  }
}
