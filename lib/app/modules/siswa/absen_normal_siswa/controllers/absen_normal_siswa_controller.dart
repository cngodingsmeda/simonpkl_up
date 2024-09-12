import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simon_pkl/all_material.dart';

class AbsenNormalSiswaController extends GetxController {
  // Variabel reaktif untuk menyimpan gambar yang dipilih
  var selectedImagePath = Rx<File?>(null);

  // Fungsi untuk mengambil gambar dari galeri
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = File(pickedFile.path); // Simpan path gambar
    } else {
      AllMaterial.cusBottomSheet(
        text: "Kesalahan!",
        subtitle: "Gambar tidak ditemukan",
      );
    }
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedImagePath.value = File(pickedFile.path);
    } else {
      AllMaterial.cusBottomSheet(
        text: "Kesalahan!",
        subtitle: "Gambar tidak ditemukan",
      );
    }
  }

  void showImageSourceDialog() {
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
                pickImageFromCamera();
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Ambil dari Galeri'),
              onTap: () {
                pickImageFromGallery();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
