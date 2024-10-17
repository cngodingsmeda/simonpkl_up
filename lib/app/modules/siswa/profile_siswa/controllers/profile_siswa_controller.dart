import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/profile_siswa_model.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/controllers/home_siswa_controller.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/controllers/homepage_siswa_controller.dart';

class ProfileSiswaController extends GetxController {
  var kelasC = TextEditingController();
  var alamatC = TextEditingController();
  var noTeleponC = TextEditingController();
  var statusPklC = TextEditingController();
  var guruPembimbingC = TextEditingController();
  var statusCode = 0.obs;
  var isLoading = true.obs;

  var profil = Rx<ProfileSiswaModel?>(null);

  Future<void> fetchProfilSiswa() async {
    print("Fetching profil siswa...");
    String token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetProfileSiswa),
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

      var profileModel = ProfileSiswaModel.fromJson(data["data"]);

      profil.value = profileModel;
      isLoading.value = false;
      HomeSiswaController.isLoading.value = false;

      HomepageSiswaController.statusPkl.value = data["data"]["status"];

      kelasC.text = profileModel.kelas!.nama.toUpperCase();
      alamatC.text = AllMaterial.setiapHurufPertama(
        '${profileModel.alamat!.detailTempat}, ${profileModel.alamat!.desa}, ${profileModel.alamat!.kecamatan}, ${profileModel.alamat!.kabupaten}, ${profileModel.alamat!.provinsi}',
      );
      noTeleponC.text = profileModel.noTelepon ?? "";
      var status = profileModel.status;
      statusPklC.text = status!.contains("pkl")
          ? "${AllMaterial.hurufPertama(status.replaceAll("_", " ").split(' ').elementAt(0))} ${status.replaceAll("_", " ").split(' ').elementAt(1).toUpperCase()}"
          : AllMaterial.hurufPertama(status);
      guruPembimbingC.text =
          AllMaterial.setiapHurufPertama(profileModel.guruPembimbing!.nama);
      update();
    } else {
      statusCode.value = 500;
      update();
      print("gagal menampilkan data");
      throw Exception('Failed to load profile');
    }
  }
}
