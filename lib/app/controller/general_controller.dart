import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/controllers/profile_siswa_controller.dart';

class GeneralController extends GetxController {
  void logoutUser(BuildContext context) {
    final homeSiswaController = Get.put(HomeSiswaController());
    Get.offAll(() => const LoginPageView());
    homeSiswaController.indexPage.value = 0;
    final profileController = Get.put(ProfileSiswaController());
    profileController.profil.value = null;
    AllMaterial.box.erase();
    AllMaterial.messageScaffold(
      title: "Logout Berhasil, Sampai Jumpa!",
      context: context,
    );
  }

  String getErrorMessage(int statusCode) {
    switch (statusCode) {
      case 400:
        return "Permintaan tidak valid. Periksa input Anda.";
      case 401:
        return "Anda tidak memiliki akses. Silakan login.";
      case 403:
        return "Anda tidak diizinkan untuk mengakses halaman ini.";
      case 404:
        return "Data tidak ditemukan.";
      case 408:
        return "Waktu habis. Silakan coba lagi.";
      case 500:
        return "Terjadi kesalahan pada server. Silakan coba lagi nanti.";
      case 502:
        return "Server sedang tidak dapat diakses. Coba lagi nanti.";
      case 503:
        return "Layanan sedang tidak tersedia. Silakan coba beberapa saat lagi.";
      case 504:
        return "Server tidak merespons tepat waktu. Silakan coba lagi.";
      default:
        return "Terjadi kesalahan tidak diketahui.";
    }
  }
}
