import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:simon_pkl/all_material.dart';

class BuatLaporanSiswaController extends GetxController {
  var inputC = TextEditingController();
  var topikC = TextEditingController();
  var inputF = FocusNode();
  var topikF = FocusNode();
  var alasanIzin = ''.obs;
  var selectedFile = Rx<File?>(null);

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
    } else {
      selectedFile.value = null;
      AllMaterial.cusBottomSheet(
          text: "Kesalahan!", subtitle: "File tidak ditemukan");
    }
  }

  void openFile(File file) async {
    await OpenFile.open(file.path);
  }

  @override
  void onClose() {
    inputC.text = "";
    topikC.text = "";
    inputC.dispose();
    topikC.dispose();
    super.onClose();
  }
}
