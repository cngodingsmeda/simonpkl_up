// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/histori_absen_siswa_model.dart';
import 'package:simon_pkl/app/modules/dudi/data_siswa_dudi/controllers/data_siswa_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/home_dudi/controllers/home_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/homepage_dudi/controllers/homepage_dudi_controller.dart';
import 'package:simon_pkl/app/modules/dudi/profile_dudi/controllers/profile_dudi_controller.dart';
import 'package:simon_pkl/app/modules/guru/home_guru/controllers/home_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/homepage_guru/controllers/homepage_guru_controller.dart';
import 'package:simon_pkl/app/modules/guru/profile_guru/controllers/profile_guru_controller.dart';
import 'package:simon_pkl/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/histori_absen_siswa/controllers/histori_absen_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/controllers/homepage_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/profile_siswa/controllers/profile_siswa_controller.dart';

class GeneralController extends GetxController {
  var logController = Get.put(LoginPageController());
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
        Get.reloadAll();
        Get.back();

        // ALL
        Get.offAll(() => const LoginPageView());
        AllMaterial.box.erase();
        AllMaterial.box.remove("token");
        AllMaterial.messageScaffold(
          title: "Logout Berhasil, Sampai Jumpa!",
          context: context,
        );

        if (logController.isGuru.value) {
          // GURU
          final homeGuruController = Get.put(HomeGuruController());
          final profileGuruController = Get.put(ProfileGuruController());
          final homePageGuruController = Get.put(HomepageGuruController());
          homeGuruController.indexPage.value = 0;
          profileGuruController.profil.value = null;
          homePageGuruController.dudiTerkait.value = null;
          homePageGuruController.jumlahDudi.value = 0;
          homePageGuruController.jumlahKendalaSiswa.value = 0;
          homePageGuruController.jumlahSiswa.value = 0;
          homePageGuruController.siswaBimbingan.value = null;
          logController.isGuru.value = false;
        } else if (logController.isSiswa.value) {
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
        } else if (logController.isDudi.value) {
          // DUDI
          final homeDudiController = Get.put(HomeDudiController());
          final homePageDudiController = Get.put(HomepageDudiController());
          final profileDudiController = Get.put(ProfileDudiController());
          homeDudiController.indexPage.value = 0;
          homePageDudiController.jumlahPengajuanProses.value = 0;
          homePageDudiController.jumlahSiswa.value = 0;
          homePageDudiController.kuotaSiswaLakiLaki.value = 0;
          homePageDudiController.kuotaSiswaPerempuan.value = 0;
          homePageDudiController.refresh();
          homePageDudiController.pengajuanPKL.value = null;
          DataSiswaDudiController.allSiswa.value = null;
          profileDudiController.profil.value = null;
          profileDudiController.isLoading.value = true;
        }
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
