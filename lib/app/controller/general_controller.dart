import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';

class GeneralController extends GetxController {
  var box = AllMaterial.box;

  void authUser() async {
    var authUser = await box.read("authUser");
    if (authUser == "siswa") {
      print("siswa");
    } else if (authUser == "guru") {
      print("guru");
    } else if (authUser == "dudi") {
      print("dudi");
    }
  }

  void logoutUser(BuildContext context) {
    Get.offAll(() => const LoginPageView());
    AllMaterial.box.erase();
    AllMaterial.messageScaffold(
      title: "Logout Berhasil, Sampai Jumpa!",
      context: context,
    );
  }
}
