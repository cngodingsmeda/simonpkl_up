import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/data_siswa_dudi_model.dart';

class DataSiswaDudiController extends GetxController {
  static var allSiswa = Rxn<DataSiswaDudiModel>();
  var token = AllMaterial.box.read("token");

  @override
  void onInit() {
    getAllSiswa();
    super.onInit();
  }

  Future<void> getAllSiswa() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAllSiswaDudi),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        var siswa = DataSiswaDudiModel.fromJson(data);
        allSiswa.value = siswa;
        update();
      } else {
        print("Failed to load notifications");
      }
    } catch (e) {
      print("Exception occurred while fetching notifications: $e");
    }
  }
}
