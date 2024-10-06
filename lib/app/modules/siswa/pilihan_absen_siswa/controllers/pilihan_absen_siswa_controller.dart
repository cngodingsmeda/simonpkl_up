// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_siswa/jadwal_absen_siswa.dart';
import 'package:http/http.dart' as http;

class PilihanAbsenSiswaController extends GetxController {
  var isWithinRadius = false.obs;
  var isLoading = false.obs;
  var jadwalAbsenSiswa = Rx<JadwalAbsenSiswa?>(null);
  var token = AllMaterial.box.read("token");
  var latitude = Rx<double?>(null);
  var longitude = Rx<double?>(null);
  var locationService = Location();
  var msg = "".obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
    getLocation();
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
    print(response.body);
    var data = jsonDecode(response.body);
    msg.value = data["msg"];
    if (response.statusCode == 200) {
      isWithinRadius.value = true;
      update();
      print(data);
    } else {
      print("gagal mengirim data");
      throw Exception('Failed to send data');
    }
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

    // Mendapatkan lokasi pengguna
    var userLocation = await locationService.getLocation();
    latitude.value = userLocation.latitude;
    longitude.value = userLocation.longitude;
    if (userLocation.latitude != null || userLocation.longitude != null) {
      isLoading.value = true;
      await postKoordinatSiswa(userLocation.latitude, userLocation.longitude);
      print("${userLocation.latitude} : ${userLocation.longitude}");
      update();
    }
  }
}
