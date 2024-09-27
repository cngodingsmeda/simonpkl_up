import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetilSiswaDudiController extends GetxController {
  var kelasC = TextEditingController();
  var noTelpC = TextEditingController();
  var alamatC = TextEditingController();

  // var profil = Rx<Profil?>(null);

  @override
  void onInit() {
    super.onInit();
    // fetchProfil();
    kelasC.text = "XI RPL 1";
    alamatC.text = "Gomong Sakura, Nusa Tenggara Barat";
    noTelpC.text = "081234567890";
  }
}
