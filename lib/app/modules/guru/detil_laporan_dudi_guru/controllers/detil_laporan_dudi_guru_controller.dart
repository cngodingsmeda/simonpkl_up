import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_guru/detil_kendala_dudi_guru_model.dart';
import 'package:simon_pkl/app/model/model_guru/detil_laporan_dudi_guru_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetilLaporanDudiGuruController extends GetxController {
  static var isKendalaDudi = false.obs;

  var arg = Get.arguments;
  var token = AllMaterial.box.read("token");
  var kendala = Rx<DetilKendalaDudiGuruModel?>(null);
  var laporan = Rx<DetilLaporanDudiGuruModel?>(null);

  Future<void> bukaWhatsApp(String nomor) async {
    final Uri waUrl = Uri.parse("https://wa.me/$nomor");
    if (await canLaunchUrl(waUrl)) {
      await launchUrl(waUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }

  Future<void> getLaporanById() async {
    print("id laporan dudi: ${arg["id"]}");
    final response = await http.get(
      Uri.parse(
        DetilLaporanDudiGuruController.isKendalaDudi.isTrue
            ? "${ApiUrl.urlGetAllKendalaDudiGuru}/${arg["id"]}"
            : "${ApiUrl.urlGetAllLaporanHarianDudiGuru}/${arg["id"]}",
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print("id laporan: ${arg["id"]}");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data);
      if (DetilLaporanDudiGuruController.isKendalaDudi.isTrue) {
        kendala.value = DetilKendalaDudiGuruModel.fromJson(data);
      } else {
        laporan.value = DetilLaporanDudiGuruModel.fromJson(data);
      }
      update();
    } else {
      print("gagal mengambil data");
      throw Exception('Failed to get data');
    }
  }

  @override
  void onInit() {
    getLaporanById();
    super.onInit();
  }
}
