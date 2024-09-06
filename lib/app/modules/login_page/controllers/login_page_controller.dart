import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    super.onClose();
  }

  void login() {
   Get.offAll(()=> HomeSiswaView());
  }
}
