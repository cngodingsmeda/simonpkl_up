import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileGuruController extends GetxController {
  var instansiC = TextEditingController();
  var alamatC = TextEditingController();
  var noTeleponC = TextEditingController();
  var npsnInstansiC = TextEditingController();
  var guruPembimbingC = TextEditingController();

  // var profil = Rx<Profil?>(null);

  @override
  void onInit() {
    super.onInit();
    // fetchProfil();
    instansiC.text = "SMKN 2 Mataram";
    alamatC.text = "Gomong Sakura, Nusa Tenggara Barat";
    noTeleponC.text = "081234567890";
    npsnInstansiC.text = "16731421";
    guruPembimbingC.text = "Habil Arlian S.Pd";
  }

  // Future<void> fetchProfil() async {
  //   try {
  //     profil.value =
  //         await ProfileSiswaService.fetchProfilSiswa(ApiUrl.urlGetProfileSiswa);
  //   } catch (e) {
  //     print("Error fetching profil: $e");
  //   }
  // }
}
