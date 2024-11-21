import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_kendala_dudi/controllers/laporan_kendala_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/laporan_pkl_dudi/controllers/laporan_pkl_dudi_controller.dart';

class BuatLaporanPklDudiController extends GetxController {
  var selectedSiswaId = "".obs;

  var inputC = TextEditingController();
  var topikC = TextEditingController();
  var namaC = TextEditingController();
  var inputF = FocusNode();
  var topikF = FocusNode();
  var namaF = FocusNode();
  var alasanIzin = ''.obs;
  var selectedFile = Rx<File?>(null);
  var inputAtas = "".obs;
  var inputBawah = "".obs;
  var token = AllMaterial.box.read("token");

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
        text: "Kesalahan!",
        subtitle: "File tidak ditemukan",
      );
    }
  }

  Future<void> postLaporanHarianDudi(BuildContext context) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlPostLaporanHarianDudi),
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
      } else {
        Get.back();
      }
      if (LaporanPklDudiController.isKendala.isFalse) {
        final c = Get.put(LaporanPklDudiController());
        c.getAllLaporanHarianDudi();
      } else {
        final c = Get.put(LaporanKendalaDudiController());
        c.getAllLaporanKendalaDudi();
      }
      inputC.text = "";
      topikC.text = "";
      selectedFile.value = null;
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Laporan berhasil dibuat!"),
      );
      print("postLaporanHarianDudi: $data");
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> postLaporanKendalaDudi(BuildContext context) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlPostLaporanKendalaDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "tanggal": DateFormat('yyyy-MM-dd').format(DateTime.now()),
          "id_siswa": int.parse(selectedSiswaId.value),
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
      } else {
        Get.back();
      }
      if (LaporanPklDudiController.isKendala.isFalse) {
        final c = Get.put(LaporanPklDudiController());
        c.getAllLaporanHarianDudi();
      } else {
        final c = Get.put(LaporanKendalaDudiController());
        c.getAllLaporanKendalaDudi();
      }
      inputC.text = "";
      topikC.text = "";
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Laporan kendala berhasil dibuat!"),
      );
      print("postLaporanKendalaDudi: $data");
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
      );
      return;
    }

    try {
      final uri = Uri.parse(
          "${(LaporanPklDudiController.isKendala.isTrue) ? ApiUrl.urlPutFileLaporanKendalaDudi : ApiUrl.urlPutFileLaporanHarianDudi}/$id");
      final request = http.MultipartRequest(
          (LaporanPklDudiController.isKendala.isTrue) ? 'PUT' : 'PATCH', uri);

      // Header authorization
      request.headers.addAll({
        "Authorization": "Bearer $token",
      });

      final fileStream = http.MultipartFile.fromBytes(
        'file',
        await file.readAsBytes(),
        filename: file.path.split('/').last,
      );
      request.files.add(fileStream);

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);

      // Mengecek isi body response
      if (response.statusCode == 200) {
        if (LaporanPklDudiController.isKendala.isFalse) {
          final c = Get.put(LaporanPklDudiController());
          c.getAllLaporanHarianDudi();
          AllMaterial.messageScaffold(
            title: AllMaterial.hurufPertama("Laporan berhasil dibuat!"),
          );
        } else {
          final c = Get.put(LaporanKendalaDudiController());
          c.getAllLaporanKendalaDudi();
          AllMaterial.messageScaffold(
            title: AllMaterial.hurufPertama("Laporan berhasil dibuat!"),
          );
        }
        Get.back();
        inputC.text = "";
        topikC.text = "";
      } else {
        print("Error Response: ${response.body}");
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama("Gagal, coba lagi nanti!"),
        );
      }
    } catch (e) {
      print("Exception: $e");
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Terjadi kesalahan, coba lagi nanti!"),
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
    namaC.text = "";
    selectedFile.value = null;
    super.onClose();
  }
}
