// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_kendala_siswa/controllers/laporan_kendala_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/laporan_siswa/controllers/laporan_siswa_controller.dart';

class BuatLaporanSiswaController extends GetxController {
  var inputC = TextEditingController();
  var topikC = TextEditingController();
  var inputF = FocusNode();
  var topikF = FocusNode();
  var alasanIzin = ''.obs;
  var token = AllMaterial.box.read("token");
  var selectedFile = Rx<File?>(null);

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docs', 'docx', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
    } else {
      selectedFile.value = null;
      AllMaterial.cusBottomSheet(
          text: "Kesalahan!", subtitle: "File tidak ditemukan");
    }
  }

  Future<void> postLaporanHarianSiswa(BuildContext context) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlPostLaporanHarianSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "tanggal": DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "topik_pekerjaan": topikC.text,
          "rujukan_kompetensi_dasar": inputC.text
        },
      ),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var id = data["data"]["id"];
      if (selectedFile.value != null) {
        putDokumenLaporan(selectedFile.value!, id, context);
      }
      if (LaporanSiswaController.isKendala.isFalse) {
        final c = Get.put(LaporanSiswaController());
        c.getAllLaporanHarianSiswa();
      } else {
        final c = Get.put(LaporanKendalaSiswaController());
        c.getAllLaporanKendalaSiswa();
      }
      Get.back();
      inputC.text = "";
      topikC.text = "";
      selectedFile.value = null;
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Laporan berhasil dibuat!"),
        context: context,
      );
      print("postLaporanHarianSiswa: $data");
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> postLaporanKendalaSiswa(BuildContext context) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlPostLaporanKendalaSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "tanggal": DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "kendala": inputC.text,
          "deskripsi": topikC.text,
        },
      ),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var id = data["data"]["id"];
      if (selectedFile.value != null) {
        putDokumenLaporan(selectedFile.value!, id, context);
      }
      Get.back();
      if (LaporanSiswaController.isKendala.isFalse) {
        final c = Get.put(LaporanSiswaController());
        c.getAllLaporanHarianSiswa();
      } else {
        final c = Get.put(LaporanKendalaSiswaController());
        c.getAllLaporanKendalaSiswa();
      }
      inputC.text = "";
      topikC.text = "";
      selectedFile.value = null;
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Laporan kendala berhasil dibuat!"),
        context: context,
      );
      print("postLaporanKendalaSiswa: $data");
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> putDokumenLaporan(
      File? file, int id, BuildContext context) async {
    if (file == null) {
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("File tidak ditemukan!"),
        context: context,
      );
      return;
    }

    try {
      final uri = Uri.parse(
          "${(LaporanSiswaController.isKendala.isTrue) ? ApiUrl.urlPutFileLaporanKendalaSiswa : ApiUrl.urlPutFileLaporanHarianSiswa}/$id");
      final request = http.MultipartRequest('PUT', uri);

      // Header authorization
      request.headers.addAll({
        "Authorization": "Bearer $token",
      });

      // Menambahkan file sebagai multipart
      final fileStream = http.MultipartFile.fromBytes(
        'file_laporan',
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
        if (LaporanSiswaController.isKendala.isFalse) {
          final c = Get.put(LaporanSiswaController());
          c.getAllLaporanHarianSiswa();
        } else {
          final c = Get.put(LaporanKendalaSiswaController());
          c.getAllLaporanKendalaSiswa();
        }
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama("Laporan berhasil dibuat!"),
          context: context,
        );
        Get.back();
        inputC.text = "";
        topikC.text = "";
        selectedFile.value = null;
      } else {
        print("Error Response: ${response.body}");
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama("Gagal, coba lagi nanti!"),
          context: context,
        );
      }
    } catch (e) {
      print("Exception: $e");
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Terjadi kesalahan, coba lagi nanti!"),
        context: context,
      );
    }
  }

  void openFile(File file) async {
    await OpenFile.open(file.path);
  }

  @override
  void onClose() {
    inputC.text = "";
    topikC.text = "";
    selectedFile.value = null;
    super.onClose();
  }
}
