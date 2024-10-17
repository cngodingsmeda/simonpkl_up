// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/jadwal_absen_siswa.dart';

class PilihanAbsenSiswaController extends GetxController {
  static var isWithinRadius = false.obs;
  var isLoading = true.obs;
  var jadwalAbsenSiswa = Rxn<JadwalAbsenSiswa?>(null);
  var token = AllMaterial.box.read("token");
  var latitude = Rx<double?>(null);
  var longitude = Rx<double?>(null);
  var showBtm = false.obs;
  var locationService = Location();
  var hariIni = AllMaterial.ubahHari(DateTime.now().toIso8601String());
  var jenisAbsen = "".obs;
  var msg = "".obs;
  var msgAbsen = "".obs;
  var bisaAbsen = false.obs;
  var isTelat = false.obs;
  var isMasuk = false.obs;
  var isPulang = false.obs;
  var absenLuarRadius = false.obs;
  var belumAdaKoordinat = false.obs;
  static var absenSelesai = false.obs;

  var namaDudi = "".obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();
    getLocation();
    print(hariIni);
  }

  Future<void> getAllJadwalAbsen() async {
    final response = await http.get(
      Uri.parse(ApiUrl.urlGetAllJadwalAbsenSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    var data = jsonDecode(response.body);
    print("jadwal absen: ${response.body}");
    if (response.statusCode == 200) {
      var dataJadwal = JadwalAbsenSiswa.fromJson(data);
      jadwalAbsenSiswa.value = dataJadwal;
      update();
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  Future<void> postKoordinatSiswa(double? latitude, double? longitude) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlGetStatusRadiusSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "latitude": latitude!.toDouble(),
          "longitude": longitude!.toDouble(),
        },
      ),
    );

    print(response.statusCode);
    if (response.body.isNotEmpty) {
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        bool dalamRadius = data["data"]["inside_radius"];
        isWithinRadius.value = dalamRadius;
        update();
        print(data);
      } else {
        if (response.statusCode == 404) {
          belumAdaKoordinat.value = true;
        }
        print("Gagal mengirim data");
        throw Exception('Failed to send data');
      }
    } else {
      print("Response body kosong");
      if (response.statusCode != 200) {
        throw Exception('Failed to send data, response body is empty');
      }
    }
  }

  Future<void> cekJenisAbsen(double? latitude, double? longitude) async {
    final response = await http.post(
      Uri.parse(ApiUrl.urlGetJenisAbsenSiswa),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(
        {
          "latitude": latitude!.toDouble(),
          "longitude": longitude!.toDouble(),
        },
      ),
    );
    print(response.statusCode);
    print(response.body);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (isWithinRadius.isTrue) {
        await getAllJadwalAbsen();
      }
      msgAbsen.value = data["msg"];
      bisaAbsen.value = data["data"]["canAbsen"];
      var jenis = data["data"]["jenis_absen"] ?? "";
      jenisAbsen.value = jenis;
      btnAbsen(jenis);
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
  }

  void btnAbsen(String absen) {
    if (absen.contains("masuk")) {
      isMasuk.value = true;
    } else if (absen.contains("pulang")) {
      isPulang.value = true;
    } else if (absen.contains("telat")) {
      isTelat.value = true;
    } else {
      null;
    }
    update();
  }

  void getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await locationService.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationService.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await locationService.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationService.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var userLocation = await locationService.getLocation();
    latitude.value = userLocation.latitude;
    longitude.value = userLocation.longitude;
    if (userLocation.latitude != null || userLocation.longitude != null) {
      isLoading.value = false;
      print("${userLocation.latitude} : ${userLocation.longitude}");
      await postKoordinatSiswa(userLocation.latitude, userLocation.longitude);
      cekJenisAbsen(latitude.value, longitude.value);

      update();
    }
  }
}
