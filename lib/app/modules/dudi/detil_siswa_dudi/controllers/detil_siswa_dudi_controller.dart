import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/detil_data_siswa_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/detil_siswa_dudi/views/detil_siswa_dudi_view.dart';
import 'package:url_launcher/url_launcher.dart';

class DetilSiswaDudiController extends GetxController {
  var kelasC = TextEditingController();
  var noTelpC = TextEditingController();
  var alamatC = TextEditingController();

  var siswa = Rx<DetilDataSiswaDudiModel?>(null);

  Future<void> getDetilSiswaById(int id) async {
    String token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse("${ApiUrl.urlGetAllSiswaDudi}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("getDetilSiswaById: $data");

      var detilSiswa = DetilDataSiswaDudiModel.fromJson(data);
      siswa.value = detilSiswa;
      kelasC.text = detilSiswa.data?.kelas?.nama!.toUpperCase() ?? "";
      alamatC.text = AllMaterial.formatAlamat(
        '${detilSiswa.data?.alamat?.detailTempat}, ${detilSiswa.data?.alamat?.desa}, ${detilSiswa.data?.alamat?.kecamatan}, ${detilSiswa.data?.alamat?.kabupaten}, ${detilSiswa.data?.alamat?.provinsi}',
      );
      noTelpC.text = detilSiswa.data?.noTelepon ?? "";
      Get.to(() => const DetilSiswaDudiView());
      update();
    } else {
      print("gagal menampilkan data");
      throw Exception('Failed to load profile');
    }
  }

  Future<void> bukaWhatsApp(String nomor) async {
    final Uri waUrl = Uri.parse("https://wa.me/$nomor");
    if (await canLaunchUrl(waUrl)) {
      await launchUrl(waUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }
}
