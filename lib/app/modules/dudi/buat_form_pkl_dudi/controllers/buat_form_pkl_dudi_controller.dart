import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/all_jurusan_dudi_model.dart';
import 'package:simon_pkl/app/model/model_dudi/kuota_pkl_siswa_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/form_rekrut_siswa_dudi/controllers/form_rekrut_siswa_dudi_controller.dart';

class BuatFormPklDudiController extends GetxController {
  var token = AllMaterial.box.read("token");
  static var jurusan = Rx<AllJurusanDudiModel?>(null);
  var selectedJurusanId = "".obs;
  var jumlahLakiLaki = 0.obs;
  var idKuotaJurusan = "".obs;
  var jumlahPerempuan = 0.obs;
  late TextEditingController lakiC;
  late TextEditingController perempuanC;

  Future<void> getKuotaSiswa({
    required bool isPost,
    required BuildContext context,
  }) async {
    try {
      final response =
          isPost ? await _postKuotaJurusan() : await _putKuotaJurusan();
      var data = jsonDecode(response.body);
      print(data);

      if (response.statusCode == 200) {
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama(
            isPost
                ? "Form Rekrut berhasil dibuat!"
                : "Form Rekrut berhasil diperbarui!",
          ),
          context: context,
        );
        final kuotaC = Get.put(FormRekrutSiswaDudiController());
        kuotaC.getAllKuotaSiswaDudi();
        Get.back();
      } else {
        print(data["msg"]);
        AllMaterial.messageScaffold(
          title: AllMaterial.hurufPertama(data["msg"] ?? ""),
          context: context,
        );
      }
    } catch (e) {
      print("Exception: $e");
    } finally {
      update();
    }
  }

  Future<http.Response> _postKuotaJurusan() {
    return http.post(
      Uri.parse("${ApiUrl.urlGetKuotaSiswaDudi}/kuota-jurusan"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode([
        {
          "id_jurusan": int.tryParse(selectedJurusanId.value),
          "jumlah_pria": int.tryParse(lakiC.text),
          "jumlah_wanita": int.tryParse(perempuanC.text),
        }
      ]),
    );
  }

  Future<http.Response> _putKuotaJurusan() {
    return http.put(
      Uri.parse(ApiUrl.urlGetKuotaSiswaDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "kuota_jurusan": [
          {
            "id": int.tryParse(idKuotaJurusan.value) ?? 0,
            "jumlah_pria": int.tryParse(lakiC.text) ?? 0,
            "jumlah_wanita": int.tryParse(perempuanC.text) ?? 0,
          }
        ]
      }),
    );
  }

  @override
  void onInit() {
    super.onInit();

    var arg = Get.arguments ?? {};
    var id = arg["id"] ?? 0;
    Kuota? dataRekrut = (id == 0) ? null : arg["data"] as Kuota?;

    selectedJurusanId.value = dataRekrut?.jurusan?.id.toString() ?? "";
    idKuotaJurusan.value = dataRekrut?.id.toString() ?? "";
    idKuotaJurusan.value = arg["id"].toString();

    lakiC = TextEditingController(
        text: (id == 0) ? "0" : dataRekrut?.jumlahPria.toString() ?? "0");
    perempuanC = TextEditingController(
        text: (id == 0) ? "0" : dataRekrut?.jumlahWanita?.toString() ?? "0");
    print("data wanita: ${dataRekrut?.jumlahWanita}");
    print("data pria: ${dataRekrut?.jumlahPria}");
    print("kuota jurusan: ${dataRekrut?.jurusan?.nama}");
  }

  @override
  void onClose() {
    selectedJurusanId.value = "";
    jumlahLakiLaki.value = 0;
    jumlahPerempuan.value = 0;
    idKuotaJurusan.value = "";
    lakiC.text = "";
    perempuanC.text = "";
    super.onClose();
  }
}
