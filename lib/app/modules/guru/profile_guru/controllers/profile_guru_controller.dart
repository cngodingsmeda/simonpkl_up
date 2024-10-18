import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_guru/profile_guru_model.dart';

class ProfileGuruController extends GetxController {
  var instansiC = TextEditingController();
  var alamatC = TextEditingController();
  var noTeleponC = TextEditingController();
  var npsnInstansiC = TextEditingController();
  var guruPembimbingC = TextEditingController();
  var statusCode = 0.obs;
  var isLoading = true.obs;
  var profil = Rx<ProfileGuruModel?>(null);

  Future<void> fetchProfileGuru() async {
    print("Fetching profil guru...");
    String token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetProfileGuru),
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

      var profileModel = ProfileGuruModel.fromJson(data["data"]);

      profil.value = profileModel;
      isLoading.value = false;
      instansiC.text = profileModel.sekolah!.nama!.toUpperCase();
      alamatC.text = AllMaterial.setiapHurufPertama(
        '${profileModel.alamat!.detailTempat}, ${profileModel.alamat!.desa}, ${profileModel.alamat!.kecamatan}, ${profileModel.alamat!.kabupaten}, ${profileModel.alamat!.provinsi}',
      );
      noTeleponC.text = profileModel.noTelepon ?? "";

      npsnInstansiC.text = profileModel.sekolah!.npsn!;
      update();
    } else {
      statusCode.value = 500;
      update();
      print("gagal menampilkan data");
      throw Exception('Failed to load profile');
    }
  }
}
