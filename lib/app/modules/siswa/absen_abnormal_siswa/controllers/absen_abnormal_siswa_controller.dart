// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/controllers/pilihan_absen_siswa_controller.dart';

class AbsenAbnormalSiswaController extends GetxController {
  var inputC = TextEditingController();
  var inputF = FocusNode();
  var alasanIzin = ''.obs;
  var isSakit = false.obs;
  var selectedFile = Rx<File?>(null);
  var token = AllMaterial.box.read("token");
  final absenC = Get.put(PilihanAbsenSiswaController());

  Future<void> pickDocument(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['docx', 'pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
    } else {
      selectedFile.value = null;
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("File tidak ditemukan!"),
      );
    }
  }

  void openFile(File file) async {
    await OpenFile.open(file.path);
  }

  Future<void> postAbsenTelat(double? latitude, double? longitude, File file,
      String note, String status, BuildContext context) async {
    final uri = Uri.parse(ApiUrl.urlPostAbsenTelatSiswa);
    final request = http.MultipartRequest('POST', uri);

    // header
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    // field data
    request.fields['latitude'] = latitude?.toString() ?? '';
    request.fields['longitude'] = longitude?.toString() ?? '';
    request.fields['note'] = note;
    request.fields['statusizinTelat'] = status;

    // Menambahkan file sebagai multipart
    final fileStream = http.MultipartFile.fromBytes(
      'foto',
      await file.readAsBytes(),
      filename: file.path.split('/').last,
    );
    request.files.add(fileStream);

    // Mengirim request dan mendapatkan StreamedResponse
    final streamedResponse = await request.send();

    // Mengubah StreamedResponse menjadi Response agar bisa dibaca
    final response = await http.Response.fromStream(streamedResponse);

    // Mengecek isi body response
    if (response.statusCode == 200) {
      Get.off(() => HomeSiswaView());
      absenC.isMasuk.value = false;
      absenC.isPulang.value = false;
      absenC.isTelat.value = false;
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama(
            "Absen ${AllMaterial.hurufPertama(status)} berhasil!"),
      );
    } else {
      print("res: ${response.body}");
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama(
            "Absen ${AllMaterial.hurufPertama(status)} gagal, coba lagi nanti!"),
      );
    }
  }

  Future<void> postAbsenIzinSakit(double? latitude, double? longitude,
      File file, String note, String status, BuildContext context) async {
    final uri = Uri.parse((isSakit.isTrue)
        ? ApiUrl.urlPostAbsenSakitSiswa
        : ApiUrl.urlPostAbsenTelatSiswa);
    final request = http.MultipartRequest('POST', uri);

    // header
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    // field data
    request.fields['latitude'] = latitude?.toString() ?? '';
    request.fields['longitude'] = longitude?.toString() ?? '';
    request.fields['note'] = note;
    request.fields['statusizinTelat'] = status;

    // Menambahkan file sebagai multipart
    final fileStream = http.MultipartFile.fromBytes(
      'foto',
      await file.readAsBytes(),
      filename: file.path.split('/').last,
    );
    request.files.add(fileStream);

    // Mengirim request dan mendapatkan StreamedResponse
    final streamedResponse = await request.send();

    // Mengubah StreamedResponse menjadi Response agar bisa dibaca
    final response = await http.Response.fromStream(streamedResponse);

    // Mengecek isi body response
    if (response.statusCode == 200) {
      Get.off(() => HomeSiswaView());
      absenC.isMasuk.value = false;
      absenC.isPulang.value = false;
      absenC.isTelat.value = false;
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama(
            "Absen ${AllMaterial.hurufPertama(status)} berhasil!"),
      );
    } else {
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama(
            "Absen ${AllMaterial.hurufPertama(status)} gagal, coba lagi nanti!"),
      );
    }
  }

  @override
  void onClose() {
    inputC.text = "";
    inputC.dispose();
    super.onClose();
  }
}
