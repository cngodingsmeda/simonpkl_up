import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/all_pengajuan_pkl_siswa_dudi_model.dart';

class HomepageDudiController extends GetxController {
  var readCount = 0.obs;
  var jumlahSiswa = 0.obs;
  var jumlahPengajuanProses = 0.obs;
  var pengajuanPKL = Rxn<AllPengajuanPklSiswaDudiModel?>();

  Future<void> getNotifUnreadDudi() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetNotifUnreadDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      readCount.value = data["data"]["count"] ?? 0;
      print(readCount.value);
      update();
    } else {
      print("Gagal mengirim data");
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> getCountSiswaDudi() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetCountSiswaDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      jumlahSiswa.value = data["data"]["countSiswa"] ?? 0;
      update();
    } else {
      print("Gagal mengirim data");
      throw Exception('Failed to fetch data');
    }
  }

  Future<void> getAllPengajuanPKL() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetAllPengajuanPKLDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
      var pengajuan = AllPengajuanPklSiswaDudiModel.fromJson(data);
      pengajuanPKL.value = pengajuan;
      jumlahPengajuanProses.value =
          pengajuan.data!.where((element) => element.status == "proses").length;
      print("proses: ${jumlahPengajuanProses.value}");
      update();
    } else {
      print("Gagal mengirim data");
      print(data);
      throw Exception('Failed to fetch data');
    }
  }
}
