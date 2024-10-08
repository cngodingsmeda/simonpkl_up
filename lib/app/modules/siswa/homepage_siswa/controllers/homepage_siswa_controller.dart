import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/histori_absen_siswa_model.dart';
import 'package:simon_pkl/app/model/model_siswa/last_ajuan_pkl_model.dart';
import 'package:simon_pkl/app/modules/siswa/home_siswa/views/home_siswa_view.dart';

class HomepageSiswaController extends GetxController {
  var token = AllMaterial.box.read("token");
  static RxString statusPkl = "".obs;
  var readCount = 0.obs;
  var ajuanPkl = Rx<LastAjuanPklModel?>(null);
  var absenTigaHari = Rxn<AbsenModel?>(null);

  @override
  void onInit() {
    getLastAjuanPkl();
    super.onInit();
  }

  Future<void> getLastAjuanPkl() async {
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
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> getNotifUnread() async {
    final response = await http.get(
      Uri.parse(ApiUrl.urlGetNotifUnreadSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      readCount.value = data["data"]["count"];
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> batalkanPkl(int id, String alasan) async {
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
    final response = await http.get(
      Uri.parse(ApiUrl.urlGetAbsenTigaHariSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(data);
      var absen = AbsenModel.fromJson(data["data"]);
      absenTigaHari.value = absen;
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }
}
