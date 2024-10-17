// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/pilihan_absen_siswa/controllers/pilihan_absen_siswa_controller.dart';

class AbsenNormalSiswaController extends GetxController {
  var selectedImagePath = Rx<File?>(null);
  var token = AllMaterial.box.read("token");
  final absenC = Get.put(PilihanAbsenSiswaController());

  Future<void> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = File(pickedFile.path);
    } else {
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Gambar tidak ditemukan!"),
        context: context,
      );
    }
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedImagePath.value = File(pickedFile.path);
    } else {
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama("Gambar tidak ditemukan!"),
        context: context,
      );
    }
  }

  Future<void> postAbsenMasuk(double? latitude, double? longitude, File file,
      String url, BuildContext context, String status) async {
    final uri = Uri.parse(url);
    final request = http.MultipartRequest('POST', uri);

    // header
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    // field data
    request.fields['latitude'] = latitude?.toString() ?? '';
    request.fields['longitude'] = longitude?.toString() ?? '';

    // Menambahkan file sebagai multipart
    final fileStream = http.MultipartFile.fromBytes(
      'foto',
      await file.readAsBytes(),
      filename: file.path.split('/').last,
    );
    request.files.add(fileStream);

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama(
          "Absen ${AllMaterial.hurufPertama(status)} berhasil!",
        ),
        context: context,
      );
      Get.off(() => HomeSiswaView());
      absenC.isMasuk.value = false;
      absenC.isPulang.value = false;
      absenC.isTelat.value = false;
    } else {
      print(response.body);
      AllMaterial.messageScaffold(
        title: AllMaterial.hurufPertama(
          "Absen ${AllMaterial.hurufPertama(status)} gagal, coba lagi nanti!",
        ),
        context: context,
      );
    }
  }

  void showImageSourceDialog(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Ambil dari Kamera'),
              onTap: () {
                pickImageFromCamera(context);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Ambil dari Galeri'),
              onTap: () {
                pickImageFromGallery(context);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
