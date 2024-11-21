// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/controller/general_controller.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/modules/dudi/home_dudi/views/home_dudi_view.dart';
import 'package:simon_pkl/app/modules/guru/home_guru/views/home_guru_view.dart';
import 'package:simon_pkl/app/modules/login_page/views/login_page_view.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/controllers/homepage_siswa_controller.dart';

class LoginPageController extends GetxController {
  var isAuth = false.obs;
  var role = ''.obs;
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FocusNode userF = FocusNode();
  FocusNode passF = FocusNode();
  var isPasswordHidden = true.obs;
  var isGuru = false.obs;
  var isSiswa = false.obs;
  var isDudi = false.obs;
  var genController = Get.put(GeneralController);

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    super.onInit();
    checkAuthentication();
  }

  @override
  void onClose() {
    userC.text = "";
    passC.text = "";
    super.onClose();
  }

  Widget periksaRole() {
    String role = AllMaterial.box.read("role");
    if (role.contains("guru")) {
      return HomeGuruView();
    } else if (role.contains("siswa")) {
      return HomeSiswaView();
    } else if (role.contains("dudi")) {
      return HomeDudiView();
    } else {
      return const LoginPageView();
    }
  }

  Future<dynamic> login(
      BuildContext context, String username, String password) async {
    try {
      if (userC.text.isEmpty || passC.text.isEmpty) {
        AllMaterial.messageScaffold(
          title: "Username atau Password tidak boleh kosong!",
        );
        return;
      }
      final response = await http.post(
        Uri.parse(ApiUrl.urlPostLogin),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "textBody": username,
            "password": password,
          },
        ),
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final homeSiswaC = Get.put(HomepageSiswaController());
        homeSiswaC.refresh();
        var token = data["data"]["access_token"];
        AllMaterial.box.write("username", userC.text);
        AllMaterial.box.write("password", passC.text);
        AllMaterial.box.write("token", token);
        String roleData = data["data"]["role"];
        AllMaterial.box.write("role", roleData);
        isAuth.value = true;
        if (roleData.contains("guru")) {
          isGuru.value = true;
          isAuth.value = true;
          userC.text = "";
          passC.text = "";
          Get.off(() => HomeGuruView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
        } else if (roleData.contains("siswa")) {
          isSiswa.value = true;
          isAuth.value = true;
          userC.text = "";
          passC.text = "";
          Get.off(() => HomeSiswaView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
        } else if (roleData.contains("dudi")) {
          isDudi.value = true;
          isAuth.value = true;
          userC.text = "";
          passC.text = "";
          Get.off(() => HomeDudiView());
          AllMaterial.messageScaffold(
            title: "Verifikasi Berhasil, Selamat Datang!",
          );
        }
      } else {
        AllMaterial.messageScaffold(
          title: "Username atau Password salah!",
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> checkAuthentication() async {
    var token = AllMaterial.box.read("token");
    if (token != null) {
      try {
        isAuth.value = true;
        update();
      } catch (e) {
        isAuth.value = false;
      }
    } else {
      isAuth.value = false;
    }
  }
}
