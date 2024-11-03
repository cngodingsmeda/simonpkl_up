import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simon_pkl/all_material.dart';
import 'package:simon_pkl/app/data/api_url.dart';
import 'package:simon_pkl/app/model/model_dudi/detil_jadwal_absen_dudi_model.dart';
import 'package:simon_pkl/app/modules/dudi/jadwal_absen_siswa_dudi/controllers/jadwal_absen_siswa_dudi_controller.dart';

class BuatJadwalAbsenDudiController extends GetxController {
  TextEditingController absenMasukC = TextEditingController();
  TextEditingController absenPulangC = TextEditingController();
  TextEditingController minJamAbsenC = TextEditingController(text: "1");
  var isEnable = true.obs;
  var token = AllMaterial.box.read("token");
  var arg = Get.arguments;
  var id = 0.obs;
  var idPut = 0.obs;
  var detil = Rx<DetilJadwalAbsenSiswaDudiModel?>(null);

  var hariList = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];
  var selectedTopik = "Senin".obs;
  var jamMasukAwal = TimeOfDay.now().obs;
  var jamPulangAwal = TimeOfDay.now().obs;

  void setJamMasukAwal(TimeOfDay time) => jamMasukAwal.value = time;
  void setJamPulangAwal(TimeOfDay time) => jamPulangAwal.value = time;

  String formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  Future<void> getJadwalAbsenById(
      {BuildContext? context, bool isPost = false, bool isPut = false}) async {
    try {
      final response = isPut
          ? await _putJadwalAbsen(id.value)
          : isPost
              ? await _postJadwalAbsen()
              : await _fetchJadwalAbsen(id.value);

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (!isPut && !isPost) {
          detil.value = DetilJadwalAbsenSiswaDudiModel.fromJson(data);
          _isiInputDenganDataGet();
        } else {
          Get.back();
          Get.find<JadwalAbsenSiswaDudiController>().getAllJadwalAbsen();
          AllMaterial.messageScaffold(
            title: "Jadwal berhasil ${isPost ? "ditambahkan" : "diubah"}!",
            context: context!,
          );
        }
        update();
      } else {
        _showErrorMessage(context, data["msg"]);
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  void ubahStatusJadwalAbsen(bool value) {
    isEnable.value = value;
    update();
  }

  void _isiInputDenganDataGet() {
    final jadwalAbsen = detil.value;
    selectedTopik.value =
        AllMaterial.hurufPertama(jadwalAbsen?.data?.hari ?? "");
    if (jadwalAbsen?.data?.batasAbsenMasuk != null) {
      final batasAbsenMasuk = jadwalAbsen!.data!.batasAbsenMasuk!;
      jamMasukAwal.value = _parseTimeOfDay(batasAbsenMasuk);
      absenMasukC.text = formatTime(jamMasukAwal.value);
    }
    minJamAbsenC.text = jadwalAbsen?.data?.minJamKerja.toString() ?? "";
    if (jadwalAbsen?.data?.batasAbsenPulang != null) {
      final batasAbsenPulang = jadwalAbsen!.data!.batasAbsenPulang!;
      jamPulangAwal.value = _parseTimeOfDay(batasAbsenPulang);
      absenPulangC.text = formatTime(jamPulangAwal.value);
    }
    idPut.value = jadwalAbsen?.data?.id ?? 0;
  }

  TimeOfDay _parseTimeOfDay(String timeString) {
    final parts = timeString.split(":");
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  void _showErrorMessage(BuildContext? context, String message) {
    AllMaterial.messageScaffold(
      title: message,
      context: context!,
    );
  }

  Future<http.Response> _fetchJadwalAbsen(int id) {
    return http.get(
      Uri.parse("${ApiUrl.urlJadwalAbsenDudi}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
  }

  Future<http.Response> _postJadwalAbsen() {
    return http.post(
      Uri.parse(ApiUrl.urlJadwalAbsenDudi),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode([
        {
          "hari": selectedTopik.value.toLowerCase(),
          "batas_absen_masuk": formatTime(jamMasukAwal.value),
          "batas_absen_pulang": formatTime(jamPulangAwal.value),
          "min_jam_kerja": minJamAbsenC.text,
        }
      ]),
    );
  }

  Future<http.Response> _putJadwalAbsen(int id) {
    return http.put(
      Uri.parse("${ApiUrl.urlJadwalAbsenDudi}/$id"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode([
        {
          "id": idPut.value,
          "enable": isEnable.value,
          "batas_absen_masuk": formatTime(jamMasukAwal.value),
          "batas_absen_pulang": formatTime(jamPulangAwal.value),
          "min_jam_kerja": minJamAbsenC.text,
        }
      ]),
    );
  }

  @override
  void onInit() {
    super.onInit();
    id.value = arg["id"] ?? 0;
    getJadwalAbsenById(isPut: idPut.value != 0);
  }

  @override
  void onClose() {
    super.onClose();
    absenMasukC.clear();
    absenPulangC.clear();
    minJamAbsenC.clear();
    id.value = 0;
    selectedTopik.value = "Senin";
    isEnable.value = true;
    jamMasukAwal.value = TimeOfDay.now();
    jamPulangAwal.value = TimeOfDay.now();
  }
}
