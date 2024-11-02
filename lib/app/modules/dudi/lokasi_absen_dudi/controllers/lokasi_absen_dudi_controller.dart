import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/koordinat_absen_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/daftar_lokasi_absen_dudi/controllers/daftar_lokasi_absen_dudi_controller.dart';

class LokasiAbsenDudiController extends GetxController {
  TextEditingController namaTempatC = TextEditingController();
  TextEditingController radiusAbsen = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  // Observables for location data
  Rx<LatLng> currentLocation = const LatLng(0.0, 0.0).obs;
  RxBool manualLocationEnabled = false.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var tempat = "".obs;
  var radius = 0.obs;
  var token = AllMaterial.box.read("token");
  var arg = Get.arguments;
  var id = 0.obs;
  var koordinat = Rx<KoordinatAbsenDudiModel?>(null);


  Future<void> getKoordinatAbsen({
    bool isPost = false,
    bool isPut = false,
    BuildContext? context,
  }) async {
    try {
      final response = (isPost)
          ? await _postKoordinatAbsen()
          : (isPut)
              ? await _putKoordinatAbsen(id.value)
              : await _fetchKoordinatAbsen(id.value);

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("getKoordinatAbsen 200: $data");
        var koordinatAbsen = KoordinatAbsenDudiModel.fromJson(data);
        koordinat.value = koordinatAbsen;
        tempat.value = koordinatAbsen.data?.namaTempat ?? "";
        radius.value = koordinatAbsen.data?.radiusAbsenMeter ?? 0;
        id.value = koordinatAbsen.data?.id ?? 0;

        if (!isPost && !isPut) {
          namaTempatC.text = tempat.value;
          radiusAbsen.text = radius.value.toString();
        } else {
          Get.back();
          final dafCont = Get.put(DaftarLokasiAbsenDudiController());
          dafCont.getAllLokasiAbsen();
          AllMaterial.messageScaffold(
            title: "Lokasi berhasil ${isPost ? "ditambahkan" : "diubah"}!",
            context: context!,
          );
        }
        update();
      } else {
        print("getKoordinatAbsen: $data");
        AllMaterial.messageScaffold(
          title: "${data["msg"]}",
          context: context!,
        );
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  Future<http.Response> _fetchKoordinatAbsen(int id) {
    print(id);
    return http.get(
      Uri.parse("${ApiUrl.urlPostKoordinatAbsen}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
  }

  Future<http.Response> _postKoordinatAbsen() {
    return http.post(
      Uri.parse(ApiUrl.urlPostKoordinatAbsen),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "nama_tempat": namaTempatC.text,
        "latitude": latitude.value,
        "longitude": longitude.value,
        "radius_absen_meter": radiusAbsen.text
      }),
    );
  }

  Future<http.Response> _putKoordinatAbsen(int id) {
    return http.put(
      Uri.parse("${ApiUrl.urlPostKoordinatAbsen}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "nama_tempat": namaTempatC.text,
        "latitude": latitude.value,
        "longitude": longitude.value,
        "radius_absen_meter": radiusAbsen.text
      }),
    );
  }

  void toggleManualLocation() {
    manualLocationEnabled.toggle();
    if (!manualLocationEnabled.value) {
      latitudeController.clear();
      longitudeController.clear();
    }
  }

  void setManualLocation() {
    if (latitudeController.text.isNotEmpty &&
        longitudeController.text.isNotEmpty) {
      double lat = double.parse(latitudeController.text);
      double lng = double.parse(longitudeController.text);
      currentLocation.value = LatLng(lat, lng);
    }
  }

  Future<void> getUserCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    var userLocation = await location.getLocation();
    currentLocation.value =
        LatLng(userLocation.latitude!, userLocation.longitude!);

    if (userLocation.latitude != 0.0 && userLocation.longitude != 0.0) {
      latitudeController.text = userLocation.latitude!.toString();
      longitudeController.text = userLocation.longitude!.toString();
      latitude.value = userLocation.latitude!;
      longitude.value = userLocation.longitude!;
      print("latitude.value = ${userLocation.latitude!}");
      print("longitude.value = ${userLocation.longitude!}");
      update();
    }
  }

  @override
  void onInit() {
    id.value = arg["id"] ?? 0;
    getKoordinatAbsen();
    super.onInit();
  }

  @override
  void onClose() {
    namaTempatC.dispose();
    radiusAbsen.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.onClose();
  }
}
