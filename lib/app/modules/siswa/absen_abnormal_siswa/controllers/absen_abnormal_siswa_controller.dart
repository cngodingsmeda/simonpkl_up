import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';

class AbsenAbnormalSiswaController extends GetxController {
  var inputC = TextEditingController();
  var inputF = FocusNode();
  var alasanIzin = ''.obs; // Variabel untuk menyimpan input alasan izin
  var selectedFile =
      Rx<File?>(null); // Variabel untuk menyimpan file yang diunggah

  // Fungsi untuk memilih file
  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      selectedFile.value =
          File(result.files.single.path!); // Simpan file yang dipilih
    } else {
      // File tidak dipilih
      selectedFile.value = null;
      AllMaterial.cusBottomSheet(text: "Kesalahan!", subtitle: "File tidak ditemukan");
    }
  }
}
