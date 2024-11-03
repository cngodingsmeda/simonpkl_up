import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/detil_notifikasi_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/notifikasi_dudi/controllers/notifikasi_dudi_controller.dart';

class DetilNotifikasiDudiController extends GetxController {
  var token = AllMaterial.box.read("token");
  var detilNotif = Rx<DetilNotifikasiDudiModel?>(null);

  @override
  void onClose() {
    var getNotif = Get.put(NotifikasiDudiController());
    getNotif.getAllNotif();
    super.onClose();
  }

  Future<void> getNotifById(int id) async {
    final response = await http.get(
      Uri.parse("${ApiUrl.urlGetAllNotifDudi}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data);
      var notif = DetilNotifikasiDudiModel.fromJson(data);
      detilNotif.value = notif;
      readNotif(id);
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> readNotif(int id) async {
    final response = await http.post(
      Uri.parse("${ApiUrl.urlGetAllNotifDudi}/read/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("read: $data");
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }
}