import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/controller/general_controller.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/profile_dudi_model.dart';

class ProfileDudiController extends GetxController {
  RefreshController refreshControllerProfil = RefreshController();
  var instansiC = TextEditingController();
  var alamatC = TextEditingController();
  var noTeleponC = TextEditingController();
  var deskripsiC = TextEditingController();
  var bidangUsahaC = TextEditingController();

  var statusCode = 0.obs;
  var isLoading = true.obs;
  var profil = Rx<ProfileDudiModel?>(null);

  Future<void> fetchProfileDudi() async {
    print("Fetching profil dudi...");
    String token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetProfileDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    statusCode.value = response.statusCode;
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      var profileModel = ProfileDudiModel.fromJson(data["data"]);
      profil.value = profileModel;
      isLoading.value = false;
      instansiC.text = profileModel.dudi?.namaInstansiPerusahaan ?? "";
      alamatC.text = AllMaterial.formatAlamat(
        '${profileModel.alamat?.detailTempat}, ${profileModel.alamat?.desa}, ${profileModel.alamat?.kecamatan}, ${profileModel.alamat?.kabupaten}, ${profileModel.alamat?.provinsi}',
      );
      noTeleponC.text = profileModel.noTelepon ?? "";
      deskripsiC.text = profileModel.dudi?.deskripsi ?? "";
      
      bidangUsahaC.text = profileModel.dudi?.bidangUsaha ?? "";
      refreshControllerProfil.refreshCompleted();
      update();
    } else if (response.statusCode == 401) {
      var genController = Get.put(GeneralController());
      genController.logout(isExpired: true);
    } else {
      statusCode.value = response.statusCode;
      refreshControllerProfil.refreshFailed();
      update();
      print("gagal menampilkan data");
      throw Exception('Failed to load profile');
    }
  }

  @override
  void onInit() {
    fetchProfileDudi();
    super.onInit();
  }
}
