import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:simon_pkl/app/model/model_siswa/laporan_detil_siswa_model.dart';
import 'package:simon_pkl/app/services/service_siswa/laporan_detil_siswa_service.dart';

class DetilHistoriAbsenSiswaControllr extends GetxController {
  var buktiDokumenUrl = ''.obs;
  var buktiDokumen = Rx<File?>(null);

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

  var historiAbsenDetail = Rxn<HistoriAbsenDetilSiswa>();

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    // final String historiAbsenId = Get.arguments;
    // fetchHistoriAbsenDetail(historiAbsenId);
  }

  Future<void> fetchHistoriAbsenDetail(String id) async {
    try {
      historiAbsenDetail.value =
          await HistoriAbsenDetilSiswaService.fetchHistoriAbsenDetailSiswa(id);
    } catch (e) {
      print("Error fetching historiAbsen detail: $e");
    }
  }
}
