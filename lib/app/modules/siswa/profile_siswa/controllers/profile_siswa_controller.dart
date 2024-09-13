import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/profile_siswa_model.dart';
import 'package:simon_pkl/app/services/service_siswa/profile_siswa_service.dart';

class ProfileSiswaController extends GetxController {
  var kelasC = TextEditingController();
  var alamatC = TextEditingController();
  var noTeleponC = TextEditingController();
  var statusPklC = TextEditingController();
  var guruPembimbingC = TextEditingController();

  var profil = Rx<Profil?>(null);

  @override
  void onInit() {
    super.onInit();
    // fetchProfil();
    kelasC.text = "XI RPL 1";
    alamatC.text = "Gomong Sakura, Nusa Tenggara Barat";
    noTeleponC.text = "081234567890";
    statusPklC.text = "Sedang PKL";
    guruPembimbingC.text = "Habil Arlian S.Pd";
  }

  Future<void> fetchProfil() async {
    try {
      profil.value = await ProfileSiswaService.fetchProfilSiswa(ApiUrl.urlGetProfileSiswa);
    } catch (e) {
      print("Error fetching profil: $e");
    }
  }
}
