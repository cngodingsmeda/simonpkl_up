import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/modules/dudi/home_dudi/views/home_dudi_view.dart';
import 'package:simon_pkl/app/modules/guru/home_guru/views/home_guru_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';

class LoginPageController extends GetxController {
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FocusNode userF = FocusNode();
  FocusNode passF = FocusNode();
  var username = "".obs;
  var password = "".obs;
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onClose() {
    userC.text = "";
    passC.text = "";
    userC.dispose();
    passC.dispose();
    userF.dispose();
    passF.dispose();
    super.onClose();
  }

  void login(BuildContext context) {
    if (userC.text == "" || passC.text == "") {
      // AllMaterial.cusBottomSheet(
      //   text: "Kesalahan",
      //   subtitle: "Username atau Password tidak boleh kosong!",
      // );
      AllMaterial.messageScaffold(
        title: "Username atau Password tidak boleh kosong!",
        context: context,
      );
    } else {
      if (userC.text == "guru" && passC.text == "guru") {
        userC.text = "";
        passC.text = "";
        Get.offAll(() => HomeGuruView());
        AllMaterial.messageScaffold(
          title: "Verifikasi Berhasil, Selamat Datang!",
          context: context,
        );
      } else if (userC.text == "siswa" && passC.text == "siswa") {
        userC.text = "";
        passC.text = "";
        Get.offAll(() => HomeSiswaView());
        AllMaterial.messageScaffold(
          title: "Verifikasi Berhasil, Selamat Datang!",
          context: context,
        );
      } else if (userC.text == "dudi" && passC.text == "dudi") {
        userC.text = "";
        passC.text = "";
        Get.offAll(() => HomeDudiView());
        AllMaterial.messageScaffold(
          title: "Verifikasi Berhasil, Selamat Datang!",
          context: context,
        );
      } else {
        // AllMaterial.cusBottomSheet(
        //   text: "Kesalahan",
        //   subtitle: "Username atau Password salah!",
        // );
        AllMaterial.messageScaffold(
          title: "Username atau Password salah!",
          context: context,
        );
      }
    }
  }
}
