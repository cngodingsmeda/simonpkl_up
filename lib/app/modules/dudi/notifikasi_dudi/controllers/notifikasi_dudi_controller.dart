import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/notifikasi_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/homepage_dudi/controllers/homepage_dudi_controller.dart';

class NotifikasiDudiController extends GetxController {
  var allNotifikasi = Rxn<AllNotifikasiDudiModel>();
  var token = AllMaterial.box.read("token");

  @override
  void onInit() {
    getAllNotif();
    super.onInit();
  }

  @override
  void onClose() {
    var getNotif = Get.find<HomepageDudiController>();
    getNotif.getNotifUnreadDudi();
    super.onClose();
  }

  Future<void> getAllNotif() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllNotifDudi),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);

        allNotifikasi.value = AllNotifikasiDudiModel.fromJson(data);
        update();
      } else {
        print("Failed to load notifications");
      }
    } catch (e) {
      print("Exception occurred while fetching notifications: $e");
    }
  }
}
