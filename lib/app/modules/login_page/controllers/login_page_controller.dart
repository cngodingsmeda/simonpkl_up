import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/guru/home_guru/views/home_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';

class LoginPageController extends GetxController {
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FocusNode userF = FocusNode();
  FocusNode passF = FocusNode();
  var username = ''.obs;
  var password = ''.obs;
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onClose() {
    userC.dispose();
    passC.dispose();
    userF.dispose();
    passF.dispose();
    userC.text = "";
    passC.text = "";
    super.onClose();
  }

  void login() {
    if (userC.text == "guru" && passC.text == "guru") {
      Get.offAll(() => HomeGuruView());
    } else if (userC.text == "siswa" || passC.text == "siswa") {
      Get.offAll(() => HomeSiswaView());
    } else {
      AllMaterial.cusBottomSheet(text: "Kesalahan", subtitle: "Username atau Password salah!");
    }
  }
}
