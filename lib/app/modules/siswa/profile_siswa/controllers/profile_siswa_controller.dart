import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSiswaController extends GetxController {
  var kelasC = TextEditingController();
  var alamatC = TextEditingController();
  var noTeleponC = TextEditingController();
  var statusPklC = TextEditingController();
  var guruPembimbingC = TextEditingController();

  @override
  void onInit() {
    kelasC.text = "XI RPL 1";
    alamatC.text = "Gomong Sakura, Nusa Tenggara Barat";
    noTeleponC.text = "081234567890";
    statusPklC.text = "Sedang PKL";
    guruPembimbingC.text = "Habil Arlian S.Pd";
    super.onInit();
  }
}
