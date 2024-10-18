// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/histori_absen_siswa_model.dart';
import 'package:simon_pkl/app/modules/guru/home_guru/controllers/home_guru_controller.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/controllers/histori_absen_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/controllers/homepage_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/controllers/profile_siswa_controller.dart';

class GeneralController extends GetxController {
  Future<dynamic> logout(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.urlPostLogout),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        Get.back();
        // ALL
        Get.offAll(() => const LoginPageView());
        AllMaterial.box.erase();
        AllMaterial.box.remove("token");
        AllMaterial.messageScaffold(
          title: "Logout Berhasil, Sampai Jumpa!",
          context: context,
        );

        // GURU
        // GURU
        final homeGuruController = Get.put(HomeGuruController());
        homeGuruController.indexPage.value = 0;

        // SISWA
        final homeSiswaController = Get.put(HomeSiswaController());
        final homePageSiswaController = Get.put(HomepageSiswaController());
        final profileController = Get.put(ProfileSiswaController());
        final historiController = Get.put(HistoriAbsenSiswaControllr());
        homeSiswaController.indexPage.value = 0;
        historiController.absen.value = <Datum>[];
        homePageSiswaController.ajuanPkl.value = null;
        homePageSiswaController.readCount.value = 0;
        profileController.profil.value = null;
        profileController.isLoading.value = true;

        update();
      } else {
        AllMaterial.messageScaffold(
          title: "Kesalahan, tidak dapat melakukan aksi sebelumnya!",
          context: context,
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void logoutUser(BuildContext context) {
    // GURU
    final homeGuruController = Get.put(HomeGuruController());
    homeGuruController.indexPage.value = 0;

    // SISWA
    final homeSiswaController = Get.put(HomeSiswaController());
    final homePageSiswaController = Get.put(HomepageSiswaController());
    final profileController = Get.put(ProfileSiswaController());
    homeSiswaController.indexPage.value = 0;
    homePageSiswaController.ajuanPkl.value = null;
    profileController.profil.value = null;

    // ALL
    Get.offAll(() => const LoginPageView());
    AllMaterial.box.erase();
    AllMaterial.messageScaffold(
      title: "Logout Berhasil, Sampai Jumpa!",
      context: context,
    );
    update();
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
