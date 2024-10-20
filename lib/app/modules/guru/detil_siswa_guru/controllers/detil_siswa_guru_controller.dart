import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_guru/detil_siswa_bimbingan_guru_model.dart';
import 'package:simon_pkl/app/modules/guru/detil_siswa_guru/views/detil_siswa_guru_view.dart';
import 'package:url_launcher/url_launcher.dart';

class DetilSiswaGuruController extends GetxController {
  var kelasC = TextEditingController();
  var noTelpC = TextEditingController();
  var alamatC = TextEditingController();
  var instansiC = TextEditingController();

  var siswa = Rx<DetilSiswaBimbinganModel?>(null);

  Future<void> getDetilSiswaById(int id) async {
    String token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse("${ApiUrl.urlGetAllSiswaBimbinganGuru}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      var detilSiswa = DetilSiswaBimbinganModel.fromJson(data["data"]);
      siswa.value = detilSiswa;
      kelasC.text = detilSiswa.kelas!.nama!.toUpperCase();
      alamatC.text = AllMaterial.formatAlamat(
        '${detilSiswa.alamat!.detailTempat}, ${detilSiswa.alamat!.desa}, ${detilSiswa.alamat!.kecamatan}, ${detilSiswa.alamat!.kabupaten}, ${detilSiswa.alamat!.provinsi}',
      );
      noTelpC.text = detilSiswa.noTelepon ?? "";
      instansiC.text = detilSiswa.dudi?.namaInstansiPerusahaan ?? "";
      print(detilSiswa.dudi?.namaInstansiPerusahaan);
      Get.to(() => const DetilSiswaGuruView());

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
