import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/notif_siswa_model.dart';
import 'package:simon_pkl/app/modules/siswa/homepage_siswa/controllers/homepage_siswa_controller.dart';

class NotifikasiSiswaController extends GetxController {
  var allNotifikasi = Rxn<AllNotifikasiModel>();
  var token = AllMaterial.box.read("token");
  @override
  void onInit() {
    getAllNotif();
    super.onInit();
  }

  @override
  void onClose() {
    var getNotif = Get.put(HomepageSiswaController());
    getNotif.getNotifUnread();
    super.onClose();
  }

  Future<void> getAllNotif() async {
    final response = await http.get(
      Uri.parse(ApiUrl.urlGetAllNotifSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data);
      var notifList = data["data"] as List;
      allNotifikasi.value = AllNotifikasiModel(
        data: notifList.map((item) => Datum.fromJson(item)).toList(),
      );
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }
}
