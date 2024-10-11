import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/pilih_dudi_model.dart';
import 'package:simon_pkl/app/modules/siswa/ajuan_siswa/views/ajuan_siswa_view.dart';

class PilihDudiSiswaController extends GetxController {
  var dudi = Rx<PilihDudiModel?>(null);
  var isLoading = true.obs;
  String token = AllMaterial.box.read("token");
  var intPage = 0.obs;

  @override
  void onClose() {
    intPage.value = 0;
    update();
    super.onClose();
  }

  Future<void> fetchDudiList() async {
    final response = await http.get(
      Uri.parse("${ApiUrl.urlGetAllDudiSiswa}${intPage.value + 1}"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      var pilihDudiModel = PilihDudiModel.fromJson(data["data"]);
      isLoading.value = false;
      dudi.value = pilihDudiModel;
      update();
    } else {
      print("gagal menampilkan data");
      throw Exception('Failed to load data');
    }
  }

  Future<void> ajukanPKL(int id) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlPostAjuanPklSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "id_dudi": id,
        },
      ),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Get.back();
      Get.off(() => const AjuanSiswaView(), arguments: data["data"]["id"]);
      print(data);
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  void changePage(int index) {
    intPage.value = index;
    fetchDudiList();
  }
}
