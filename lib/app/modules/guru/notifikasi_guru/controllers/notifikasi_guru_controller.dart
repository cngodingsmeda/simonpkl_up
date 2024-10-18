import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/notif_siswa_model.dart';
import 'package:simon_pkl/app/modules/guru/notifikasi_guru/views/notifikasi_guru_view.dart';

class NotifikasiGuruController extends GetxController {
  var isLoading = true.obs;
  var allNotifikasi = Rxn<AllNotifikasiModel>();

  var token = AllMaterial.box.read("token");

  Future<void> getAllNotif() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllNotifGuru),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        allNotifikasi.value = AllNotifikasiModel.fromJson(data);
        Get.to(() => const NotifikasiGuruView());
        update();
      } else {
        print("Failed to load notifications");
      }
    } catch (e) {
      print("Exception occurred while fetching notifications: $e");
    }
  }
}
