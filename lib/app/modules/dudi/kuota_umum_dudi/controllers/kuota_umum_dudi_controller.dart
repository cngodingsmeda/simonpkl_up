import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/kuota_pkl_siswa_dudi_model.dart';

class KuotaUmumDudiController extends GetxController {
  late TextEditingController lakiC;
  late TextEditingController perempuanC;

  var kuotaLaki = 0.obs;
  var id = 0.obs;
  var kuotaPerempuan = 0.obs;
  var kuotaDudi = Rx<KuotaDudiModel?>(null);
  var token = AllMaterial.box.read("token");

  @override
  void onInit() {
    lakiC = TextEditingController();
    perempuanC = TextEditingController();
    getKuotaSiswa();
    super.onInit();
  }

  Future<void> getKuotaSiswa(
      {bool isPost = false, bool isPut = false, BuildContext? context}) async {
    try {
      final response = (isPost)
          ? await _postKuotaSiswa()
          : (isPut)
              ? await _putKuotaSiswa()
              : await _fetchKuotaSiswa();

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var kuota = KuotaDudiModel.fromJson(data);
        kuotaDudi.value = kuota;
        kuotaLaki.value = kuotaDudi.value?.data?.kuota?.jumlahPria ?? 0;
        kuotaPerempuan.value = kuotaDudi.value?.data?.kuota?.jumlahWanita ?? 0;
        id.value = kuota.data?.kuota?.id ?? 0;

        if (!isPost && !isPut) {
          lakiC.text = "${kuotaLaki.value}";
          perempuanC.text = "${kuotaPerempuan.value}";
        } else {
          Get.back();
          AllMaterial.messageScaffold(
            title: "Form Rekrut berhasil dibuat!",
              
          );
        }
        update();
      } else {
        print("getKuotaSiswa: ${response.body}");
        AllMaterial.messageScaffold(
          title: "Kesalahan, coba lagi nanti!",
            
        );
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  Future<http.Response> _fetchKuotaSiswa() {
    return http.get(
      Uri.parse(ApiUrl.urlGetKuotaSiswaDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
  }

  Future<http.Response> _postKuotaSiswa() {
    return http.post(
      Uri.parse(ApiUrl.urlGetKuotaSiswaDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "jumlah_pria": int.tryParse(lakiC.text) ?? 0,
        "jumlah_wanita": int.tryParse(perempuanC.text) ?? 0,
      }),
    );
  }

  Future<http.Response> _putKuotaSiswa() {
    return http.put(
      Uri.parse(ApiUrl.urlGetKuotaSiswaDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "jumlah_pria": int.tryParse(lakiC.text) ?? 0,
        "jumlah_wanita": int.tryParse(perempuanC.text) ?? 0,
      }),
    );
  }

  @override
  void onClose() {
    lakiC.dispose();
    perempuanC.dispose();
    super.onClose();
  }
}
