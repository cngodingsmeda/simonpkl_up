import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/histori_absen_siswa_model.dart';
import 'package:simon_pkl/app/model/model_siswa/last_ajuan_pkl_model.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';

class HomepageSiswaController extends GetxController {
  static RxString statusPkl = "".obs;
  var readCount = 0.obs;
  var ajuanPkl = Rx<LastAjuanPklModel?>(null);
  var absenTigaHari = <Datum>[].obs;
  var nisSiswa = "".obs;

  Future<void> getLastAjuanPkl() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetLastPengajuanPklSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
      var lastAjuanPkl = LastAjuanPklModel.fromJson(data["data"]);
      ajuanPkl.value = lastAjuanPkl;
      print(lastAjuanPkl.status);
      statusPkl.value = lastAjuanPkl.status;
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> getNotifUnread() async {
    var token = AllMaterial.box.read("token");

    final response = await http.get(
      Uri.parse(ApiUrl.urlGetNotifUnreadSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      readCount.value = data["data"]["count"];
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> batalkanPkl(int id, String alasan) async {
    var token = AllMaterial.box.read("token");

    print(id);
    final response = await http.put(
      Uri.parse(ApiUrl.urlPutCancelAjuanPklSiswa + id.toString()),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {"alasan": alasan},
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      AllMaterial.box.remove("statusSiswa");
      statusPkl.value = "belum_pkl";
      Get.off(() => HomeSiswaView());
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> getAbsenTigaHari() async {
    var token = AllMaterial.box.read("token");
    try {
      final response = await http.get(
        Uri.parse(ApiUrl.urlGetAbsenTigaHariSiswa),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      print("status: ${response.statusCode}");
      var data = jsonDecode(response.body);
      print("absen tiga hari: $data");

      if (response.statusCode == 200) {
        if (data["data"] is List) {
          absenTigaHari.value = List<Datum>.from(
              data["data"].map((item) => Datum.fromJson(item)));
          nisSiswa.value = data["data"]["nis"];
          update();
        } else {
          print("Data yang diterima tidak sesuai format list");
        }
        update();
      } else {
        print("Gagal mengambil data absen");
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
