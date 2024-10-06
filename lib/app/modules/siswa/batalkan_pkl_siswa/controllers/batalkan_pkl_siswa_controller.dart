import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BatalkanPklSiswaController extends GetxController {
  var alasanC = TextEditingController();
  var jurusanC = TextEditingController();
  var alasanF = FocusNode();

  @override
  void onInit() {
    var arg = Get.arguments;

    jurusanC.text = arg["instansi"];
    super.onInit();
  }
}
