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
}
