import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';

class GeneralController extends GetxController {
  void logoutUser(BuildContext context) {
    final homeSiswaController = Get.put(HomeSiswaController());
    homeSiswaController.indexPage.value = 0;
    Get.offAll(() => const LoginPageView());
    AllMaterial.box.erase();
    AllMaterial.messageScaffold(
      title: "Logout Berhasil, Sampai Jumpa!",
      context: context,
    );
  }
}
